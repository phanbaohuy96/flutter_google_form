part of 'form_listing_bloc.dart';

abstract class FormListingEvent {}

class GetFormsEvent extends FormListingEvent {}

class LoadMoreFormsEvent extends FormListingEvent {}