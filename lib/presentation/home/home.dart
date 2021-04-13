import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_3/domain/bloc/counter/counter_bloc.dart';
import 'package:flutter_application_3/domain/bloc/counter/counter_state.dart';
import 'package:flutter_application_3/domain/bloc/counter/counter_event.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              if (state.status == CounterStatus.init) {
                return Center(child: Text("Go ahead, tap someone!"));
              }

              if (state.status == CounterStatus.counting) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.status == CounterStatus.counted) {
                return Text(
                  state.counter.value.toString(),
                  style: Theme.of(context).textTheme.headline1,
                );
              }
              return Container();
            }),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(EventIncrement()),
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(EventRandomNumWithDelay()),
                    tooltip: 'Refresh',
                    child: Icon(Icons.refresh),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(EventRandomFromHttpRequest(range: 1)),
                    tooltip: 'RandomHttp',
                    child: Icon(Icons.cloud),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(EventDecrement()),
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
