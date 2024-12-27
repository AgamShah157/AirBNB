# AirBNB - Hotel Demand Analysis

**About:**

Airbnb is a leading online marketplace for accommodations. This project analyzes data on New York City listings, including types, prices, and availability, to identify areas for improvement and enhance customer satisfaction.

**Purpose:**

* Optimize pricing across neighborhoods to increase occupancy rates.
* Improve listings based on customer preferences.
* Enhance the customer experience by identifying areas for improvement.

**Data:**

* **Listings Table:**
    * `id`: Unique identifier for each listing.
    * `name`: Name of the listing.
    * `host_id`: Unique identifier for the host.
    * `host_name`: Name of the host.
    * `neighbourhood_group`: Neighborhood group of the listing.
    * `neighbourhood`: Specific neighborhood of the listing.
    * `room_type`: Type of room (e.g., Private room, Entire home/apt).
* **Booking Details Table:**
    * `listing_id`: Unique identifier for each listing.
    * `price`: Nightly price of the listing.
    * `minimum_nights`: Minimum number of nights for booking.
    * `number_of_reviews`: Total number of reviews.
    * `reviews_per_month`: Average reviews per month.
    * `calculated_host_listings_count`: Number of listings by the host.
    * `availability_365`: Number of days available for booking in a year.

**Tools:**

* **SQL:** Filtering, Counting, Joining Tables, Aggregations, Subqueries
* **Excel:** Advanced Formulas, Functions, VBA, Pivot Tables

**Data Analysis Areas:**

**1. Price Analysis**

* **Objective:** Understand pricing trends and patterns.
    * **Key Questions:**
        * Price range (min, max, average)
        * Price variations by neighborhood, room type, and host
        * Price outliers
        * Price correlations with availability, reviews, and amenities

**2. Stay Duration Analysis**

* **Objective:** Examine the typical length of stays.
    * **Key Questions:**
        * Average length of stay
        * Distribution of stay durations (short-term vs. long-term)
        * Stay duration variations by season, neighborhood, and room type
        * Minimum and maximum stay requirements

**3. Availability Analysis**

* **Objective:** Investigate listing availability.
    * **Key Questions:**
        * Average listing availability
        * Seasonal trends in availability
        * Availability variations across neighborhoods and room types
        * Listings with consistently high or low availability
