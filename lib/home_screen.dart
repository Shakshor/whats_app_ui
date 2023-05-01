import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WhatsApp'),

            // bottom tab bar
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text('Chats'),
                ),
                Tab(
                  child: Text('Status'),
                ),
                Tab(
                  child: Text('Calls'),
                ),
              ],
            ),

            // sidebar && pop-up menu
            actions: [
              const Icon(Icons.search),
              const SizedBox(width: 10,),
              PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context)=>const [
                     PopupMenuItem(
                        value: '1',
                        child: Text('New Button')
                    ),
                     PopupMenuItem(
                        value: '2',
                        child: Text('Settings')
                    ),
                    PopupMenuItem(
                        value: '3',
                        child: Text('Logout')
                    ),
                  ]),
              SizedBox(width: 10,),
            ],

          ),

          // body
          body:  TabBarView(
            children: [

              // camera view
              const Text('camera'),

              // chats view
              ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index){
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?w=826&t=st=1682600941~exp=1682601541~hmac=f55623753f306fd4b030d689bbe77c884058dba5fa18054d74739d7a208cb56f'),
                      ),
                      title: Text('John Wick'),
                      subtitle: Text('Where is my dog?'),
                      trailing: Text('6:32 pm'),
                    );
                  }
              ),


              // status view
              ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index){

                    if(index == 0){
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text('New Update'),
                            ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blue,
                                        width: 3
                                    )
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?w=826&t=st=1682600941~exp=1682601541~hmac=f55623753f306fd4b030d689bbe77c884058dba5fa18054d74739d7a208cb56f'),
                                ),
                              ),
                              title: Text('John Wick'),
                              subtitle: Text('30 minutes ago'),
                            ),
                          ],
                        ),
                      );
                    }else{
                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.green,
                                  width: 3
                              )
                          ),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?w=826&t=st=1682600941~exp=1682601541~hmac=f55623753f306fd4b030d689bbe77c884058dba5fa18054d74739d7a208cb56f'),
                          ),
                        ),
                        title: Text('John Wick'),
                        subtitle: Text('30 minutes ago'),
                      );
                    }


                  }),

              // calls view
              ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context,index){
                    return  ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?w=826&t=st=1682600941~exp=1682601541~hmac=f55623753f306fd4b030d689bbe77c884058dba5fa18054d74739d7a208cb56f'),
                      ),
                      title: const Text('John Wick'),
                      subtitle: Text(index %2 == 0 ? 'Missed Call' : 'Video Call'),
                      trailing: Icon(index %2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ],
          ),
        ));
  }
}
