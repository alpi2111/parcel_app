import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        //child: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -80.0,
              left: 80.0,
              child: RotatedBox(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Theme.of(context).primaryColorLight),
                ),
                quarterTurns: 3,
              ),
            ),
            Positioned(
              top: 150.0,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
              ),
            ),
            Positioned(
              top: 60.0,
              left: 80.0 + 75.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(100.0)),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.drag_handle,
                            size: 35.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('swiper');
                          },
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            size: 35.0,
                          ),
                          color: Colors.white,
                          onPressed: () => Navigator.of(context).pushNamed('perritos'),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F42977075%2F960x0.jpg%3Ffit%3Dscale'),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Donald Trump',
                              style: Theme.of(context).textTheme.display1,
                            ),
                            Text(
                              '+380 156 789 123',
                              style: Theme.of(context).textTheme.subtitle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.60),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.80,
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '10%',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Text('Discount%',
                            style: Theme.of(context).textTheme.subtitle),
                      ],
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Divider(
                        color: Colors.white,
                        indent: 380.0,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "\$20",
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Text('Bonuses',
                            style: Theme.of(context).textTheme.subtitle),
                      ],
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Divider(
                        color: Colors.white,
                        indent: 380.0,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '\$104',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Text('Deposit',
                            style: Theme.of(context).textTheme.subtitle),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
            )
          ],
        ),
      ),
      // ),
    );
  }
}