import 'package:gql_app/graphql/graphql_api.dart';
import 'package:gql_app/services/gql_client.dart';

class JobsRepo {
  static Future<List<GetJobs$Query$Job>> getJobs() async {
    final result = await GQLClient.query(document: GetJobsQuery().document);

    print(result);
    return GetJobs$Query.fromJson(result ?? {}).jobs;
  }
}
