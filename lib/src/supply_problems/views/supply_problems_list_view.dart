import 'package:cima_client/src/medication_detail/views/medication_detail_page.dart';
import 'package:cima_model/cima_model.dart' show ProblemaSuministro;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SupplyProblemsListWidget extends StatelessWidget {
  const SupplyProblemsListWidget({
    Key? key,
    required this.supplyProblemsList,
  }) : super(key: key);

  final List<ProblemaSuministro> supplyProblemsList;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return ListView.builder(
      itemCount: supplyProblemsList.length,
      itemBuilder: (context, index) {
        final problemaSuministro = supplyProblemsList[index];
        return InkWell(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problemaSuministro.nombre ?? '',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    problemaSuministro.observ ?? '',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Desde: ${dateFormat.format(DateTime.fromMillisecondsSinceEpoch(problemaSuministro.fini!))}'),
                      Text(
                          'Hasta: ${dateFormat.format(DateTime.fromMillisecondsSinceEpoch(problemaSuministro.ffin!))}'),
                    ],
                  )
                ],
              ),
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicationDetailPage(
                cn: problemaSuministro.cn,
              ),
            ),
          ),
        );
      },
    );
  }
}