# bloc_project

This projects demonstrates how you can manage the state of your app with DTos considered using the bloc pattern which covers the use of 

-  bloc_stage_one branch : Streams (sink and streams) and StreamController

- bloc_stage_two branch StreamBuilder
, certain methods that the stream controller provides (onListen , add, .....)

- bloc_stage_three branch :  Using  Cubit and Equitable from the flutter_bloc and equitable package ,blocProvider to render state UI and dependecy injection of cubit up the widget tree

- bloc_stage_four branch : BlocBuilder to render state UI and rebuilds over time and dependecy injection of cubit up the widget tree and has a buildWhen method which returns a bool of when to rebuild 

- bloc_stage_five branch : BlocListener(to listen to state only in UI and runs block on state)  has a buildWhen method which returns a bool of when to listen

- bloc_stage_six branch : BlocConsumer which is the combination of bloc listeners and bloc builders which has the listenWhen and buildWhen function too


- bloc_stage_seven branch : BuildContext extension