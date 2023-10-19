import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {

          if(state is AddNoteFailure)
            {
              print('failed ${state.errorMessage}');

            }
          if(state is AddNoteSuccess)
            {
              Navigator.pop(context);
            }


        },
        builder: (context, state) {
          print ('uirebuild');
          return  AbsorbPointer(
            absorbing: state is AddNoteLoading ?true: false,
            child:   Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,bottom:const MediaQueryData().viewInsets.bottom),
              child:const SingleChildScrollView(child: AddNoteForm()),
            ),
          );

          /*

          SizedBox(
            height: 500,
            child: ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false ,
                child: const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(child: AddNoteForm()),
                )),
          );
           */

        },
      ),
    );
  }
}
