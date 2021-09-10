package booking.faker;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {
    public static JSONObject newBookingFakeData() {
        Faker faker = new Faker();
        String firstname = faker.name().firstName();
        String lastname = faker.name().lastName();
        int totalPrice = faker.random().nextInt(100, 250);
        boolean depositPaid = faker.random().nextBoolean();
        String checkin = faker.random().nextInt(1900, 2000).toString() + "-0" +
                faker.random().nextInt(1, 9) + "-" + faker.random().nextInt(10, 28);
        String checkout = faker.random().nextInt(2000, 2050).toString() + "-" +
                faker.random().nextInt(10, 11) + "-" + faker.random().nextInt(10, 28);
        String additionalNeeds = faker.rickAndMorty().character();

        JSONObject bookingDatesJson = new JSONObject();
        bookingDatesJson.put("checkin", checkin);
        bookingDatesJson.put("checkout", checkout);

        JSONObject newBookingJson = new JSONObject();
        newBookingJson.put("firstname", firstname);
        newBookingJson.put("lastname", lastname);
        newBookingJson.put("totalprice", totalPrice);
        newBookingJson.put("depositpaid", depositPaid);
        newBookingJson.put("bookingdates", bookingDatesJson);
        newBookingJson.put("additionalneeds", additionalNeeds);

        return newBookingJson;
    }

    public static JSONObject newPartialBookingData() {
        Faker faker = new Faker();
        String firstname = faker.name().firstName();
        String lastname = faker.name().lastName();

        JSONObject newBookingJson = new JSONObject();
        newBookingJson.put("firstname", firstname);
        newBookingJson.put("lastname", lastname);

        return newBookingJson;
    }
}
