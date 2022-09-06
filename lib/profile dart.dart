import 'package:flutter/material.dart';

import './post.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  final urlProfile = 'https://daengweb.id/front/d-blog/img/favicon.png';

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('daengwebid', style: TextStyle(color: Colors.black)),
            Icon(Icons.arrow_drop_down, color: Colors.black)
          ],
        ),
        actions: <Widget>[Icon(Icons.menu, color: Colors.black)],
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LastViewed(),
            ProfileInformation(urlProfile: urlProfile),
            ProfileDescription(),
            ShortcutButton(),
            Divider(),
            ListPosts(tabController: _tabController),
          ],
           ),
      ),
    );
  }
}

class ListPosts extends StatelessWidget {
  const ListPosts({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.border_all)),
              Tab(icon: Icon(Icons.assignment_ind)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                GridView.count(
                  physics: ScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  children: <String>[
                    'https://upload.wikimedia.org/wikipedia/commons/0/01/LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg',
                    'https://images-na.ssl-images-amazon.com/images/I/41dKkez-1rL._SX326_BO1,204,203,200_.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/0/01/Bill_Gates_July_2014.jpg'
                  ].map((String url) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Post(url)));
                      },
                      child: GridTile(
                        child: Hero(tag: url, child: Image.network(url, fit: BoxFit.cover)),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  height: 100,
                  color: Colors.pinkAccent,
                  child: Center(
                    child: Text('DAENGWEB.ID'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShortcutButton extends StatelessWidget {
  const ShortcutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Edit Profile'),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Promotions'),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Contact'),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Daeng Web ID",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Community Organization",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Laravel, Flutter, Vue.js Tutorial. Blogger & Trainer about programming language",
          ),
          Text(
            "https://daengweb.id",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key key,
    @required this.urlProfile,
  }) : super(key: key);

  final String urlProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                urlProfile,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                '14',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Posts",
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text('131',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Followers", style: TextStyle(color: Colors.black45))
            ],
          ),
          Column(
            children: <Widget>[
              Text('42',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Following", style: TextStyle(color: Colors.black45))
            ],
          ),
        ],
      ),
    );
  }
}

class LastViewed extends StatelessWidget {
  const LastViewed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(' profile visits in the last 7 days',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}