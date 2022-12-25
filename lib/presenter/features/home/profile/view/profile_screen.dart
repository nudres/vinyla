import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gravatar_utils/gravatar_utils_extensions.dart';
import 'package:vinyla/config/l10n/l10n.dart';

import 'package:vinyla/domain/domain.dart';

import 'package:vinyla/presenter/common/common.dart';

import '../bloc/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileCubit _bloc = BlocProvider.of(context);

  late final TextTheme _textTheme = Theme.of(context).textTheme;
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;

  @override
  void initState() {
    super.initState();
    _bloc.tryGetProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (BuildContext context, ProfileState state) {
            if (state is FailureProfileState) _showFailureDialog(state.type, state.message);
          },
          builder: (context, state) => SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(MediaQuery.of(context).size.width * 0.5, 100.0),
                                bottomRight: Radius.elliptical(MediaQuery.of(context).size.width * 0.5, 100.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Text(
                                        state.fullName,
                                        style: _textTheme.titleLarge?.copyWith(
                                          letterSpacing: 8,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        state.isOnline ? context.l10n.profile_online : context.l10n.profile_offline,
                                        style: _textTheme.labelMedium?.copyWith(
                                          color: state.isOnline ? _colorScheme.surface : _colorScheme.background,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: _colorScheme.background,
                                child: Icon(
                                  Icons.chat,
                                  size: 24,
                                  color: _colorScheme.primary,
                                ),
                              ),
                              UrlUserAvatar(
                                url: state.email.gravatarImageUrl(
                                  scheme: "https",
                                  size: 80,
                                ),
                                name: state.fullName,
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: _colorScheme.background,
                                child: Icon(
                                  Icons.settings,
                                  size: 24,
                                  color: _colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Date Of creation",
                              style: _textTheme.titleSmall,
                            ),
                            Text(
                              state.dateOfCreation,
                              textAlign: TextAlign.center,
                              style: _textTheme.bodySmall,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Date of last visit",
                              style: _textTheme.titleSmall,
                            ),
                            Text(
                              state.dateOfLastVisit,
                              textAlign: TextAlign.center,
                              style: _textTheme.bodySmall,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                    child: Text(
                      state.bio,
                      style: _textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showFailureDialog(BaseExceptionType? type, String? message) {
    final title = context.l10n.common_exception_title;
    final description = context.getMessage(type, message);
    context.showFailureAlertDialog(title, description);
  }
}
