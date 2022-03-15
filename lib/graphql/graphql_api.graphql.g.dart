// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetJobs$Query$Job$Commitment _$GetJobs$Query$Job$CommitmentFromJson(
        Map<String, dynamic> json) =>
    GetJobs$Query$Job$Commitment()..title = json['title'] as String;

Map<String, dynamic> _$GetJobs$Query$Job$CommitmentToJson(
        GetJobs$Query$Job$Commitment instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

GetJobs$Query$Job$Company _$GetJobs$Query$Job$CompanyFromJson(
        Map<String, dynamic> json) =>
    GetJobs$Query$Job$Company()
      ..name = json['name'] as String
      ..logoUrl = json['logoUrl'] as String?
      ..websiteUrl = json['websiteUrl'] as String;

Map<String, dynamic> _$GetJobs$Query$Job$CompanyToJson(
        GetJobs$Query$Job$Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'websiteUrl': instance.websiteUrl,
    };

GetJobs$Query$Job$City$Country _$GetJobs$Query$Job$City$CountryFromJson(
        Map<String, dynamic> json) =>
    GetJobs$Query$Job$City$Country()..name = json['name'] as String;

Map<String, dynamic> _$GetJobs$Query$Job$City$CountryToJson(
        GetJobs$Query$Job$City$Country instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

GetJobs$Query$Job$City _$GetJobs$Query$Job$CityFromJson(
        Map<String, dynamic> json) =>
    GetJobs$Query$Job$City()
      ..name = json['name'] as String
      ..country = GetJobs$Query$Job$City$Country.fromJson(
          json['country'] as Map<String, dynamic>);

Map<String, dynamic> _$GetJobs$Query$Job$CityToJson(
        GetJobs$Query$Job$City instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country.toJson(),
    };

GetJobs$Query$Job$Tag _$GetJobs$Query$Job$TagFromJson(
        Map<String, dynamic> json) =>
    GetJobs$Query$Job$Tag()
      ..name = json['name'] as String
      ..id = json['id'] as String;

Map<String, dynamic> _$GetJobs$Query$Job$TagToJson(
        GetJobs$Query$Job$Tag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

GetJobs$Query$Job _$GetJobs$Query$JobFromJson(Map<String, dynamic> json) =>
    GetJobs$Query$Job()
      ..commitment = GetJobs$Query$Job$Commitment.fromJson(
          json['commitment'] as Map<String, dynamic>)
      ..company = json['company'] == null
          ? null
          : GetJobs$Query$Job$Company.fromJson(
              json['company'] as Map<String, dynamic>)
      ..title = json['title'] as String
      ..description = json['description'] as String?
      ..applyUrl = json['applyUrl'] as String?
      ..cities = (json['cities'] as List<dynamic>?)
          ?.map(
              (e) => GetJobs$Query$Job$City.fromJson(e as Map<String, dynamic>))
          .toList()
      ..tags = (json['tags'] as List<dynamic>?)
          ?.map(
              (e) => GetJobs$Query$Job$Tag.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetJobs$Query$JobToJson(GetJobs$Query$Job instance) =>
    <String, dynamic>{
      'commitment': instance.commitment.toJson(),
      'company': instance.company?.toJson(),
      'title': instance.title,
      'description': instance.description,
      'applyUrl': instance.applyUrl,
      'cities': instance.cities?.map((e) => e.toJson()).toList(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
    };

GetJobs$Query _$GetJobs$QueryFromJson(Map<String, dynamic> json) =>
    GetJobs$Query()
      ..jobs = (json['jobs'] as List<dynamic>)
          .map((e) => GetJobs$Query$Job.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetJobs$QueryToJson(GetJobs$Query instance) =>
    <String, dynamic>{
      'jobs': instance.jobs.map((e) => e.toJson()).toList(),
    };
