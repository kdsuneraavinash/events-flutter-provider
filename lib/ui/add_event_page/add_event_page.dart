import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({
    Key key,
  }) : super(key: key);

  @override
  AddEventPageState createState() {
    return AddEventPageState();
  }
}

class AddEventPageState extends State<AddEventPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentStep = 0;
  bool isAllDay = false;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      _buildStepper(content: _buildNamePage(), index: 0),
      _buildStepper(content: _buildDescriptionPage(), index: 1),
      _buildStepper(content: _buildVenuePage(), index: 2),
      _buildStepper(content: _buildDatePage(), index: 3),
      _buildStepper(content: _buildTimePage(), index: 4),
      _buildStepper(content: _buildTagPage(), index: 5),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Event."),
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          steps: steps,
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepCancel: () => Navigator.pop(context),
          onStepTapped: (index) => setState(() => currentStep = index),
          onStepContinue: () => setState(() {
                if (currentStep < steps.length - 1) {
                  currentStep++;
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) Navigator.pop(context);
        },
        child: Icon(FontAwesomeIcons.save),
      ),
    );
  }

  Widget _buildNamePage() {
    return _buildTextField(
      label: "Event Name",
      validator: (value) {
        if (value.isEmpty) return "Please enter a name for the event";
      },
    );
  }

  Widget _buildDescriptionPage() {
    return _buildTextField(
      label: "Event Description",
      validator: (String value) {
        if (value.isEmpty) return "Please enter a name for the event";
        if (value.replaceAll("\n", "\s").split("\s").length < 200)
          return "Please enter at least 200 words.";
      },
      maxLines: 5,
    );
  }

  Widget _buildVenuePage() {
    return _buildTextField(
      label: "Venue",
      validator: (value) {
        if (value.isEmpty) return "Please enter a valid venue";
      },
    );
  }

  Widget _buildDatePage() {
    return Column(
      children: <Widget>[
        _buildDatePicker(
          label: "Start Date",
          validator: (value) {},
        ),
        _buildDatePicker(
          label: "End Date",
          helper: "Event end date must be on or after start date.",
          validator: (value) {},
        )
      ],
    );
  }

  Widget _buildTimePage() {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          onChanged: (v) => setState(() => isAllDay = v),
          value: isAllDay,
          title: Text("This is an all day event"),
          subtitle: Text("If you uncheck this you can provide exact time."),
          isThreeLine: true,
        ),
        IgnorePointer(
          ignoring: isAllDay,
          child: AnimatedOpacity(
            opacity: isAllDay ? 0.5 : 1.0,
            duration: Duration(milliseconds: 500),
            child: _buildTimePicker(
              label: "Start Time",
              validator: (value) {},
            ),
          ),
        ),
        IgnorePointer(
          ignoring: isAllDay,
          child: AnimatedOpacity(
            opacity: isAllDay ? 0.5 : 1.0,
            duration: Duration(milliseconds: 500),
            child: _buildTimePicker(
              label: "End Time",
              validator: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagPage() {
    return _buildTextField(
      label: "Tags",
      helper: "Add tags here seperated by spaces.",
      validator: (value) {},
    );
  }

  Step _buildStepper({Widget content, int index}) {
    return Step(
      content: content,
      isActive: currentStep == index,
      title: Container(),
      subtitle: Container(),
    );
  }

  Widget _buildDatePicker(
      {String label, String helper, IconData icon, Function validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimePickerFormField(
        dateOnly: true,
        format: DateFormat("EEEE, MMMM d, yyyy"),
        decoration: InputDecoration(
          helperText: helper,
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildTimePicker(
      {String label, String helper, IconData icon, Function validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TimePickerFormField(
        format: DateFormat("h:mm a"),
        decoration: InputDecoration(
          helperText: helper,
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildTextField(
      {String label, String helper, Function validator, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            helperText: helper,
            labelText: label,
            border: OutlineInputBorder(),
          ),
          validator: validator),
    );
  }
}
