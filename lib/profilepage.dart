import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterimageapp/producyServ.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }
    // Future uploadPic(BuildContext context) async {
    //   String fileName = basename(_image.path);
    //   StorageReference firebaseStorageRef =
    //       FirebaseStorage.instance.ref().child(fileName);
    //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    //   setState(() {
    //     print("Profile Picture uploaded");
    //     Scaffold.of(context)
    //         .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    //   });
    // }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              'assets/teclado.jpg',
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.35,
            initialChildSize: 0.40,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                child: (_image != null)
                                    ? Image.file(_image, fit: BoxFit.fill)
                                    : Image.asset(
                                        'assets/user.jpg',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Carlos Rivera Perez',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Roboto',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Fronend Developer',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Santiago Queretaro',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.sms,
                              color: Colors.blue,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: IconButton(
                          color: Colors.blue,
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),

                      //Performace bar
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _crearAcercade(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _crearProducto(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _crearReputacion(),
                      ),
                      _crearTextComentarios(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: _crearContenComentarios(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _crearAcercade() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Divider(indent: 2),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Acerca de...',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: new Text(
                      'Editar descripcion',
                      style: TextStyle(fontSize: 13, color: Colors.blue[900]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Divider(
            height: 25,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _crearProducto() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Divider(indent: 2),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Productos o Servicios',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () => _showOverlay(context),
                    child: new Text(
                      'Editar Seccion',
                      style: TextStyle(fontSize: 13, color: Colors.blue[900]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Divider(
            height: 10,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
          Image.network(
            'https://datademia.es/wp-content/uploads/2020/03/que-es-python1-1024x576.png',
            height: 95,
            width: 180,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Servicio: Curso Python',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Descripcion: Curso Python',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            thickness: 0,
            indent: 10,
            endIndent: 5,
            color: Colors.grey,
          ),
          Image.network(
            'https://classes.engineering.wustl.edu/cse231/core/images/2/26/Java.png',
            height: 70,
            width: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Servicio: Curso Java',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Descripcion: Curso Java',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearReputacion() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Reputacion',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Divider(
            height: 25,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '3.0',
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
                size: 35.0,
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {},
              child: new Text(
                'Numero de Evaluaciones 3',
                style: TextStyle(fontSize: 14.5, color: Colors.blue[900]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearTextComentarios() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Comentarios',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Divider(
            height: 25,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _crearContenComentarios() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: 500,
        height: 250,
        child: Container(
          child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 0, top: 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Prueba',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0,
                  indent: 10,
                  endIndent: 5,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 0, top: 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Regular',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0,
                  indent: 10,
                  endIndent: 5,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 0, top: 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Simple',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                  thickness: 1.5,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showOverlay(Context context) {}
