function fn() {
    var config = {
        apiUrl: "https://restful-booker.herokuapp.com",
    };

    karate.configure('headers', {'Content-Type': 'application/json'})
    karate.configure('headers', {Accept: 'application/json'})

    return config;
}