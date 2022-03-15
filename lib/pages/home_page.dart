import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gql_app/graphql/graphql_api.dart';
import 'package:gql_app/repositories/jobs_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GetJobs$Query$Job> _jobs = [];

  Future<void> getJobs() async {
    _jobs = await JobsRepo.getJobs();
    setLoading(false);
  }

  bool isLoading = true;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void initState() {
    getJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GQL Jobs'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: getJobs,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _jobs.length,
                itemBuilder: (ctx, idx) => ItemTile(
                  _jobs[idx],
                ),
              ),
            ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile(
    this._job, {
    Key? key,
  }) : super(key: key);
  final GetJobs$Query$Job _job;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          context: context,
          builder: (_) => ApplyBottomSheet(
                companyName: _job.company?.name ?? '',
                applyUrl: _job.applyUrl ?? '',
                description: _job.description ?? '',
                title: _job.title,
              )),
      child: BasicContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    if (await canLaunch(_job.company?.websiteUrl ?? '')) {
                      launch(_job.company!.websiteUrl);
                    }
                  },
                  child: CachedNetworkImage(
                    height: 30,
                    width: 30,
                    imageUrl: _job.company?.logoUrl ?? '',
                    errorWidget: (_, __, ___) => Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  _job.company?.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _job.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (_job.cities?.isNotEmpty ?? false)
                  Text(
                    "${_job.cities?[0].name}, ${_job.cities?[0].country.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                const Text(
                  " - ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  _job.commitment.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _job.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tags',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 5,
              children: [
                for (GetJobs$Query$Job$Tag tag in _job.tags!) Text(tag.name)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ApplyBottomSheet extends StatelessWidget {
  const ApplyBottomSheet({
    Key? key,
    required this.description,
    required this.title,
    required this.companyName,
    required this.applyUrl,
  }) : super(key: key);

  final String description;
  final String title;
  final String companyName;
  final String applyUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "$title at $companyName",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                color: Colors.black,
                onPressed: () async {
                  if (await canLaunch(applyUrl)) {
                    launch(applyUrl);
                  }
                },
                child: const Text(
                  'Apply Now',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }
}

class BasicContainer extends StatelessWidget {
  const BasicContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}
