// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetJobs$Query$Job$Commitment extends JsonSerializable
    with EquatableMixin {
  GetJobs$Query$Job$Commitment();

  factory GetJobs$Query$Job$Commitment.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$Query$Job$CommitmentFromJson(json);

  late String title;

  @override
  List<Object?> get props => [title];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$Query$Job$CommitmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetJobs$Query$Job$Company extends JsonSerializable with EquatableMixin {
  GetJobs$Query$Job$Company();

  factory GetJobs$Query$Job$Company.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$Query$Job$CompanyFromJson(json);

  late String name;

  String? logoUrl;

  late String websiteUrl;

  @override
  List<Object?> get props => [name, logoUrl, websiteUrl];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$Query$Job$CompanyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetJobs$Query$Job$City$Country extends JsonSerializable
    with EquatableMixin {
  GetJobs$Query$Job$City$Country();

  factory GetJobs$Query$Job$City$Country.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$Query$Job$City$CountryFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$Query$Job$City$CountryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetJobs$Query$Job$City extends JsonSerializable with EquatableMixin {
  GetJobs$Query$Job$City();

  factory GetJobs$Query$Job$City.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$Query$Job$CityFromJson(json);

  late String name;

  late GetJobs$Query$Job$City$Country country;

  @override
  List<Object?> get props => [name, country];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$Query$Job$CityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetJobs$Query$Job$Tag extends JsonSerializable with EquatableMixin {
  GetJobs$Query$Job$Tag();

  factory GetJobs$Query$Job$Tag.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$Query$Job$TagFromJson(json);

  late String name;

  late String id;

  @override
  List<Object?> get props => [name, id];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$Query$Job$TagToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetJobs$Query$Job extends JsonSerializable with EquatableMixin {
  GetJobs$Query$Job();

  factory GetJobs$Query$Job.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$Query$JobFromJson(json);

  late GetJobs$Query$Job$Commitment commitment;

  GetJobs$Query$Job$Company? company;

  late String title;

  String? description;

  String? applyUrl;

  List<GetJobs$Query$Job$City>? cities;

  List<GetJobs$Query$Job$Tag>? tags;

  @override
  List<Object?> get props =>
      [commitment, company, title, description, applyUrl, cities, tags];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$Query$JobToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetJobs$Query extends JsonSerializable with EquatableMixin {
  GetJobs$Query();

  factory GetJobs$Query.fromJson(Map<String, dynamic> json) =>
      _$GetJobs$QueryFromJson(json);

  late List<GetJobs$Query$Job> jobs;

  @override
  List<Object?> get props => [jobs];
  @override
  Map<String, dynamic> toJson() => _$GetJobs$QueryToJson(this);
}

final GET_JOBS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetJobs'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'jobs'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'commitment'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'company'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'logoUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'websiteUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'applyUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'cities'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'country'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ])),
              FieldNode(
                  name: NameNode(value: 'tags'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class GetJobsQuery extends GraphQLQuery<GetJobs$Query, JsonSerializable> {
  GetJobsQuery();

  @override
  final DocumentNode document = GET_JOBS_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetJobs';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetJobs$Query parse(Map<String, dynamic> json) =>
      GetJobs$Query.fromJson(json);
}
