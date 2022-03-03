import 'package:flutter/material.dart';
import 'package:gdsc_solution_challenge/models/event_model.dart';
import 'package:gdsc_solution_challenge/providers/theme_provider.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EventDetailScreen extends StatelessWidget {
  // route name
  static const routeName = '/event-detail';

  // constructor
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final panelOpenHeight = MediaQuery.of(context).size.height * 0.8;

    final event = ModalRoute.of(context)!.settings.arguments as Event;
    return Container(
      decoration: BoxDecoration(
        gradient: context.watch<Themes>().currentThemeBackgroundGradient,
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(event.eventTitle),
          ),
          body: SlidingUpPanel(
            maxHeight: panelOpenHeight,
            renderPanelSheet: false,
            panel: GlassContainer.clearGlass(
              height: panelOpenHeight,
              width: double.maxFinite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                          child: Image.network(
                            event.image,
                            height: (constraints.maxHeight * 0.35) - 2,
                            width: constraints.maxWidth - 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.65,
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    event.eventTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          event.date,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          event.venue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Join'),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Organized by:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      event.organizerName,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'About the event:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      event.description,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            body: Center(
              child: Text(event.eventTitle),
            ),
          )),
    );
  }
}