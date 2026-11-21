import 'package:flutter/material.dart';
void main()=>runApp(const ClubApp());
const green=Color(0xFF08251C), panel=Color(0xFF123D2D), gold=Color(0xFFE7BD55), cream=Color(0xFFF8EAC8);
class ClubApp extends StatelessWidget{
 const ClubApp({super.key});
 @override Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false,title:'Teen Patti Club',theme:ThemeData.dark().copyWith(scaffoldBackgroundColor:green,colorScheme:ColorScheme.fromSeed(seedColor:gold,brightness:Brightness.dark)),home:const Home());
}
class Home extends StatefulWidget{const Home({super.key});@override State<Home> createState()=>_HomeState();}
class _HomeState extends State<Home>{
 int tab=0; final int coins=25000;
 void play(String game)=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Practice(game:game)));
 Widget card(String suit,String name,String desc,VoidCallback action)=>Card(color:panel,child:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(suit,style:const TextStyle(fontSize:42,color:gold)),Text(name,style:const TextStyle(fontSize:24,color:gold,fontWeight:FontWeight.bold)),Text(desc),const SizedBox(height:12),SizedBox(width:double.infinity,child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:gold,foregroundColor:green),onPressed:action,child:const Text('OPEN PRACTICE GAME')))])));
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('♠ TEEN PATTI CLUB',style:TextStyle(color:gold)),actions:[Padding(padding:const EdgeInsets.all(12),child:Center(child:Text('$coins 🪙')))]),body:IndexedStack(index:tab,children:[
 ListView(padding:const EdgeInsets.all(16),children:[const Text('PLAY • CONNECT • ENJOY',style:TextStyle(color:gold,letterSpacing:2)),const SizedBox(height:16),card('♠','Teen Patti','Classic 3-card social game • 2–6 players',()=>play('Teen Patti')),card('♦','Rummy','13-card social Rummy',()=>play('Rummy')),const Text('Virtual coins only. No cash prizes, deposits or withdrawals.')]),
 ListView(padding:const EdgeInsets.all(16),children:[const Text('Choose a practice game',style:TextStyle(color:gold,fontSize:22)),card('♠','Teen Patti','Local practice table',()=>play('Teen Patti')),card('♦','Rummy','Local practice table',()=>play('Rummy'))]),
 const Center(child:Text('25,000 virtual coins\nNo cash value',textAlign:TextAlign.center)),
 const Center(child:Text('Guest profile\nGoogle and OTP login not connected',textAlign:TextAlign.center))
 ]),bottomNavigationBar:NavigationBar(backgroundColor:panel,selectedIndex:tab,onDestinationSelected:(v)=>setState(()=>tab=v),destinations:const[NavigationDestination(icon:Icon(Icons.home),label:'Home'),NavigationDestination(icon:Icon(Icons.style),label:'Games'),NavigationDestination(icon:Icon(Icons.account_balance_wallet),label:'Wallet'),NavigationDestination(icon:Icon(Icons.person),label:'Profile')]));
}
class Practice extends StatefulWidget{final String game;const Practice({super.key,required this.game});@override State<Practice> createState()=>_PracticeState();}
class _PracticeState extends State<Practice>{
 bool shown=false;String status='Practice table ready.';
 @override Widget build(BuildContext context){
 final teen=widget.game=='Teen Patti';final cards=teen?['A♠','K♥','7♦']:['A♠','2♠','3♠','7♥','8♥','9♥','J♦','Q♦','K♦','4♣','5♣','8♣','10♠'];
 return Scaffold(appBar:AppBar(title:Text('${widget.game} Practice'),leading:BackButton(onPressed:()=>Navigator.pop(context))),body:ListView(padding:const EdgeInsets.all(16),children:[Container(padding:const EdgeInsets.all(18),decoration:BoxDecoration(color:panel,border:Border.all(color:gold),borderRadius:BorderRadius.circular(20)),child:Column(children:[const Text('♠ TEEN PATTI CLUB ♠',style:TextStyle(color:gold,fontWeight:FontWeight.bold)),const SizedBox(height:12),const Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[Text('Player 1'),Text('Player 2'),Text('You')]),const SizedBox(height:22),Text(teen?'YOUR THREE CARDS':'YOUR RUMMY HAND',style:const TextStyle(color:cream)),const SizedBox(height:12),Wrap(alignment:WrapAlignment.center,spacing:6,runSpacing:8,children:cards.map((c)=>Container(width:52,height:76,alignment:Alignment.center,decoration:BoxDecoration(color:shown?Colors.white:const Color(0xFF244B39),borderRadius:BorderRadius.circular(8),border:Border.all(color:gold)),child:Text(shown?c:'★',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:shown?(c.contains('♥')||c.contains('♦')?Colors.red:green):gold)))).toList()),const SizedBox(height:18),Text(status,textAlign:TextAlign.center),const SizedBox(height:12),if(teen)Wrap(alignment:WrapAlignment.center,spacing:6,children:['SEE','CHAAL','PACK','SHOW'].map((a)=>OutlinedButton(onPressed:()=>setState(()=>{shown=true,status='$a selected in practice mode.'}),child:Text(a))).toList())else ElevatedButton(onPressed:()=>setState(()=>{shown=!shown,status=shown?'Sample hand hidden.':'Sample hand revealed.'}),child:Text(shown?'HIDE HAND':'SHOW HAND')),TextButton(onPressed:()=>setState(()=>{shown=false,status='New practice round ready.'}),child:const Text('RESET ROUND'))])),const SizedBox(height:12),const Text('Offline practice UI only. Online multiplayer, account login and server game rules are not connected.',textAlign:TextAlign.center,style:TextStyle(color:Colors.white70,fontSize:12))]));
 }
}
