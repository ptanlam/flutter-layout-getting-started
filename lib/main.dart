import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Columns',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row and Columns'),
        ),
        backgroundColor: Colors.indigo.shade100,
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Container(
      width: sizeX,
      height: sizeY,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: createGallery(20),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5),
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    var squares = <Widget>[];

    while (i < numSquares) {
      var square = Container(
        color: colors[i % 5],
        width: 100.0,
        height: 100.0,
        child: Text(i.toString()),
      );
      i++;
      squares.add(square);
    }

    return squares;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    var square = Container(
      color: colors[position % 5],
      width: 100.0,
      height: 100.0,
      child: Text(position.toString()),
    );

    return square;
  }

  Widget createSeperator(int position) {
    var seperator = Container(
      height: 15,
      color: Colors.black,
    );
    return seperator;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    var layoutChildren = <Widget>[];

    var background = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('http://bit.ly/pizzaimage'),
              fit: BoxFit.fitHeight)),
    );

    layoutChildren.add(background);

    var pizzaCard = Positioned(
        top: sizeY / 20,
        left: sizeX / 20,
        child: Card(
          elevation: 12,
          color: Colors.white70,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                "Pizza Marghenrita",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade800),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'This delicious pizza is made in Brazil. ' +
                      '\nYou have to eat it \n \n ',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                ),
              )
            ],
          ),
        ));

    layoutChildren.add(pizzaCard);

    var buttnOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: ElevatedButton(
        child: Text(
          'Order Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {},
      ),
    );

    layoutChildren.add(buttnOrder);

    return layoutChildren;
  }

  List<Contact> buildContacts() {
    var contacts = <Contact>[];

    contacts.add(
      Contact('Thomas', 'Matrix', Icons.sentiment_neutral),
    );
    contacts.add(
      Contact('Frank', 'Scent', Icons.sentiment_satisfied),
    );
    contacts.add(
      Contact('Mildred', 'Billboards', Icons.sentiment_dissatisfied),
    );
    contacts.add(
      Contact('Jamal', 'Millionare', Icons.sentiment_satisfied),
    );

    return contacts;
  }

  List<ListTile> showContacts() {
    var contacts = buildContacts();

    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }

    var list = <ListTile>[];

    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subtitle),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.amber.shade600,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ));
    });

    return list;
  }

  List<Widget> createGallery(int numImages) {
    var list = <Widget>[];

    var urls = <String>[];
    for (var i = 1; i < 6; i++) {
      urls.add('http://bit.ly/gv_car_${i}');
    }

    var image, i = 0;

    while (i < numImages) {
      image = Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(urls[i % 5]))),
      );
      list.add(image);
      i++;
    }

    return list;
  }
}

class Contact {
  String name;
  String subtitle;
  IconData icon;

  Contact(this.name, this.subtitle, this.icon);
}
