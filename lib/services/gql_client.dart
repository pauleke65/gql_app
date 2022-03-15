import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/ast.dart';

class GQLClient {
  static final HttpLink _httpLink = HttpLink(
    'https://api.graphql.jobs/',
  );

  static ValueNotifier<GraphQLClient>? _client;

  static void initializeClient() {
    // final authLink = AuthLink(
    //   getToken: () => _token,
    //   headerKey: 'x-hasura-admin-secret',
    // );
    // final link = authLink.concat(_httpLink);

    _client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: InMemoryStore()),
        link: _httpLink, //link,
      ),
    );
  }

  static Future<Map<String, dynamic>?> query({
    required DocumentNode document,
    Map<String, dynamic> variables = const {},
  }) async {
    try {
      final result = await _client!.value.query(QueryOptions(
        document: document,
        variables: variables,
      ));

      if (result.hasException) {
        inspect(result.exception);
        return null;
      }

      inspect(result);
      return result.data;
    } catch (e) {
      inspect(e);
      return null;
    }
  }

  static Future<Map<String, dynamic>?> mutate({
    required DocumentNode document,
    Map<String, dynamic> variables = const {},
  }) async {
    try {
      final result = await _client!.value
          .mutate(MutationOptions(document: document, variables: variables));

      if (result.hasException) {
        inspect(result.exception);
        return null;
      }

      inspect(result);
      return result.data;
    } catch (e) {
      inspect(e);
      return null;
    }
  }
}
