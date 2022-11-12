Center(
  child: FutureBuilder<List<dynamic>>(
    future: getJobsData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var id = snapshot.data![index]['id'];
              var name = snapshot.data![index]['name'];
              var username = snapshot.data![index]['username'];
              var email = snapshot.data![index]['email'];
              var phone = snapshot.data![index]['phone'];
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green.shade300,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Text(id.toString()),
                  title: Text(name),
                  subtitle: Text(
                    username + '\n' + email + '\n' + phone.toString(),
                  ),
                ),
              );
            },
          ),
        );
      }
      return const CircularProgressIndicator();
    },
  ),
),