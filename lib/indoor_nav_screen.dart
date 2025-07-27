import 'package:flutter/material.dart';
import 'room_data.dart';

class IndoorNavScreen extends StatefulWidget {
  const IndoorNavScreen({super.key});

  @override
  State<IndoorNavScreen> createState() => _IndoorNavScreenState();
}

class _IndoorNavScreenState extends State<IndoorNavScreen> {
  String? selectedInput;
  RoomLocation? selectedLocation;

  void handleSelection(String input) {
    final location = findRoomLocation(input);
    setState(() {
      selectedInput = input;
      selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allTerms = getAllSearchableTerms();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Indoor Navigation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search Room or Faculty:',
              style: TextStyle(fontSize: 16),
            ),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return allTerms.where(
                  (item) => textEditingValue.text
                      .toLowerCase()
                      .split(' ')
                      .every((word) => item.toLowerCase().contains(word)),
                );
              },
              onSelected: handleSelection,
              fieldViewBuilder: (
                context,
                controller,
                focusNode,
                onFieldSubmitted,
              ) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    hintText: 'Enter room or faculty name',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            if (selectedLocation != null) ...[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Destination Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.meeting_room),
                          const SizedBox(width: 8),
                          Text(
                            'Room: ${selectedLocation!.roomName}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (selectedLocation!.roomDescription != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                selectedLocation!.roomDescription!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 8),
                      if (selectedLocation!.matchedFaculty != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${selectedLocation!.matchedFaculty!.name} (${selectedLocation!.matchedFaculty!.designation})',
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.apartment),
                          const SizedBox(width: 8),
                          Text(
                            'Block: ${selectedLocation!.block}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.layers),
                          const SizedBox(width: 8),
                          Text(
                            'Floor: ${selectedLocation!.floor}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'Floor Map',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const SizedBox(height: 4),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: InteractiveViewer(
                    key: ValueKey(selectedLocation!.floorMapImage),
                    panEnabled: true,
                    minScale: 1,
                    maxScale: 4,
                    child: Image.asset(
                      selectedLocation!.floorMapImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
