import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:image_picker/image_picker.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/routes/app_router.dart";
import "package:revogarageapp/generated/l10n.dart";

class CreateSmsGroupScreen extends StatefulWidget {
  const CreateSmsGroupScreen({super.key});

  @override
  State<CreateSmsGroupScreen> createState() => _CreateSmsGroupScreenState();
}

class _CreateSmsGroupScreenState extends State<CreateSmsGroupScreen> with SingleTickerProviderStateMixin {
  late final TextEditingController _groupNameController;

  final ImagePicker _picker = ImagePicker();
  XFile? selectedProfileImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _groupNameController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RevoScreenHeader(
            title: AppLocalizations.of(context).create_group,
          ),
          GestureDetector(
            onTap: () {
              addPhotoDialog(context, () => takePhoto(isProfileImage: true), multiImagePicker);
            },
            // child: CircleAvatar(
            //   radius: 50,
            //   backgroundImage: selectedProfileImage == null ? null : FileImage(File(selectedProfileImage!.path)),
            //   child: selectedProfileImage == null ? const Icon(Icons.add_photo_alternate_outlined) : null,
            // ),
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _groupNameController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).name_of_group,
                prefixIcon: const Icon(Icons.groups_outlined),
              ),
              validator: RequiredValidator(
                errorText: AppLocalizations.current.empty_error,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: FilledButton.icon(
                  onPressed: () {
                    context.router.navigate(const PickMembersOfGroupRoute());
                  },
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  label: Text(
                    AppLocalizations.of(context).add_members_to_group,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (final context, final index) {
                  return Card(
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: const CircleAvatar(
                        child: Icon(Icons.person_outline),
                      ),
                      subtitle: const Text("+41422342234"),
                      title: const Text("dfdfdf"),
                      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.cancel_outlined)),
                    ),
                  );
                },
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    AppLocalizations.of(context).save,
                  ),
                ),
              ),
            ],
          ),
          //sss
        ],
      ),
    );
  }

  Future<void> multiImagePicker({final bool isMultiImagePicker = false}) async {
    try {
      final pickedProfileImage = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      setState(() {
        selectedProfileImage = pickedProfileImage;
      });
    } catch (e) {
      debugPrint(
        "Kabul edilemez resim formati kullanilmiş olabilir",
      );
      showSnackBarUnsupportedFileType();
    }
  }

  Future<void> takePhoto({final bool isProfileImage = false}) async {
    final pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      selectedProfileImage = pickedImage;
    });
  }

  void showSnackBarUnsupportedFileType() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).file_type_is_not_supported)));
  }

  Future<dynamic> addPhotoDialog(
    final BuildContext context,
    final VoidCallback takePhotoFunction,
    final VoidCallback uploadPhotoFunction,
  ) {
    return showDialog(
      context: context,
      builder: (final context) => SimpleDialog(
        title: Text(
          AppLocalizations.of(context).add_photo,
          textAlign: TextAlign.center,
        ),
        children: [
          TextButton.icon(
            label: Text(
              AppLocalizations.of(context).take_photo,
            ),
            onPressed: () {
              takePhotoFunction();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          TextButton.icon(
            label: Text(
              AppLocalizations.of(context).choose_from_gallery,
            ),
            onPressed: () {
              uploadPhotoFunction();
              Navigator.of(context).pop();
              //  Navigator.pop(context);
            },
            icon: const Icon(Icons.add_photo_alternate_outlined),
          ),
        ],
      ),
    );
  }
}
