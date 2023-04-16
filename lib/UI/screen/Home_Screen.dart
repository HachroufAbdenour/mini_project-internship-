import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart';
import '../../Data/Repository/repository.dart';
import '../../Data/model/user_model.dart';
import '../../constant/colors.dart';
import 'User_Details_Sceen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> allUsers;
  late List<User> searchedForUsers = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

// widget == function to open textfield
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Find a user ..........................',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (seachedUsers) {
        addSearchedForItemsToSearchedList(seachedUsers);
      },
    );
  }

//_----------------------
  void addSearchedForItemsToSearchedList(String seachedUsers) {
    searchedForUsers = allUsers
        .where((character) => character.username!
            .toLowerCase()
            .startsWith(seachedUsers.toLowerCase()))
        .toList();
    setState(() {});
  }

//_-------B---------------
  List<Widget> _buildAppBarAction() {
    //********************  itha kanet search
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
          onPressed: _startSearch,
        ),
      ];
    }
  }

//***************************************************************

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch()));
    setState(() {
      _isSearching = true;
    });
  }

  //***************************************************************

  _stopSearch() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    _searchTextController.clear();
    setState(() {
      _isSearching = false;
    });
  }

//****************************************
  Widget _buildAppBarTitle() {
    return const Text(
      "Users",
      style: TextStyle(color: MyColors.myGrey),
    );
  }
//return Card Widget

// separated widget cases state bloc

//***********************************************************************************
//--1- widget <show loading Indicator>

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  //**********************************************************************
// ____ build bloc widget ___________________________
  Widget _buildBlocWidget() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return showLoadingIndicator();
        }

        // just test where erroe is existe  ''print("data is Before");

        if (state is UserLoadedState) {
// just test where erroe is existe   print("data is loaded from server");
// hna ndir condition ask (is searching) use-->  userlist or (non  searching ) use -->listserched
          allUsers = state.users;

          return buildloadedListWidget();
        }

        if (state is UserErrorState) {
          allUsers = state.usersdb;
          return buildloadedListWidget();
        }

        return showOtherCase();
      },
    );
  }

//--2- widget <show loading error>
// fi cas one ki ykon error yrje3 widget represent error

  Widget showError() {
    return const Center(
      child: Text(
        "Erorr",
        style: TextStyle(
            fontSize: 44, color: Colors.amber, backgroundColor: Colors.brown),
      ),
    );
  }

//--- widget <show  Other Case>
  Widget showOtherCase() {
    return const Center(
        child: Text(
      "Nothing",
      style: TextStyle(
          fontSize: 44, color: Colors.amber, backgroundColor: Colors.brown),
    ));
  }

// widget loaded data successfully
  Widget buildloadedListWidget() {
    return ListView.builder(
        itemCount: _searchTextController.text.isEmpty
            ? allUsers.length
            : searchedForUsers.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserDetailsScreen(
                          e: _isSearching
                              ? searchedForUsers[index]
                              : allUsers[index],
                          context: context,
                        )));
              },
              child: Card(
                color: MyColors.kSecondaryColor,
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  title: Text(
                    "${_isSearching ? searchedForUsers[index].username : allUsers[index].username}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: AutofillHints.birthday,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${_isSearching ? searchedForUsers[index].email : allUsers[index].email}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: AutofillHints.birthday,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        });
  }

//***********************************************************************************

//***************************************************************

// -----------build method------------------
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<Repository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.kSecondaryColor,
          title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
          actions: _buildAppBarAction(),
        ),
        body: _buildBlocWidget(),
      ),
    );
  }
}
