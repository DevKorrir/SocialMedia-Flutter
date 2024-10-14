import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [

          //dawer header
          DrawerHeader(
              child: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
          ),

          const SizedBox(height: 25),

          //home title
          Padding(
              padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("H O M E"),
              onTap: (){
                //just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          //profile tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("P R O F I L E"),
              onTap: (){
                //just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

        //user tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.group,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("U S E R S"),
              onTap: (){
                //just pop drawer
                Navigator.pop(context);
              },
            ),
          ),],),

          //logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("L O G O U T"),
              onTap: (){
                //just pop drawer
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
