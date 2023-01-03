import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailWidget extends StatelessWidget {
  const MedicationDetailWidget({super.key, required this.medicamento});

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentMedication = (context.watch<MedicationDetailBloc>().state
            is AvailableMedicationDetailState)
        ? (context.watch<MedicationDetailBloc>().state
                as AvailableMedicationDetailState)
            .medicamento
        : medicamento;

    return SingleChildScrollView(
      child: Column(
        children: [
          MedicationPhotoWidget(photo: currentMedication.photoMaterialAs),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentMedication.nombre ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  currentMedication.labtitular ?? '',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                if (currentMedication.nregistro != null)
                  Text(
                    '${l10n.registration_number}: ${currentMedication.nregistro!}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ButtonRowWidget(medicamento: currentMedication),
                if (currentMedication.formaFarmaceutica != null)
                  ListTile(
                    title: Text(l10n.pharmaceutical_form),
                    subtitle:
                        Text('${currentMedication.formaFarmaceutica!.nombre}'),
                    leading: PharmaceuticalFormPhotoWidget(
                      photo: currentMedication.photoFormaFarmaceutica,
                    ),
                  ),
                if (currentMedication.dosis != null)
                  ListTile(
                    title: Text(l10n.dose),
                    subtitle: Text(currentMedication.dosis!),
                  ),
                if (currentMedication.cpresc != null)
                  AlertMedicationWidget(medicamento: currentMedication),
              ],
            ),
          )
        ],
      ),
    );
  }
}