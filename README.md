# BigPie Events Backend
This server application is designed to augment the existing BigPie application to be able to handle the concept of a Fundraising Event.

## Database Description
The primary database tables are as follows:

1) events  
2) merchants  
3) nonprofits  
4) rsvps  

With enumeration tables:

1) attendance_levels  
2) merchant_sizes  
3) nonprofit_sizes  
4) event_types  
5) merchant_types  
6) nonprofit_types  
7) cost_groups  

And join tables:

1) merchants_events
2) sponsors_events
3) nonprofits_events

##### In addition to the information shown below, all tables will have created_at, updated_at and deleted_at fields, so that we can keep better track of records and delete them without actually removing them from the database.

### The Events Table

The Events table is designed to represent all of the information specific to the event itself.

#### Fields

1) startDate (Datetime) - The timestamp of the start of the event
2) endDate (Datetime) - The timestamp of the end of the event
3) name (String) - The event name
4) amountRaised (Decimal) - The total amount raised
5) rsvpRequired (True or False) - Whether or not an RSVP is required for this event
6) expectedAttendance (Integer) - The ID of the appropriate record in the attendance_levels enumeration table

### The Merchants Table

The Merchants table stores all relevant information about the merchant itself.

I am considering adding a "best_event_type" field so that nonprofits looking for a certain kind of event could more easily find merchant hosts for that type.

#### Fields

1) bigpie_id (String) - The MongoDB id of this merchant in the live BigPie database
2) name (String) - The name of this merchant
3) totalSales (Decimal) - The total sales driven through events (or through BigPie?)
4) totalGiveback (Decimal) - The total amount this merchant has donated through BigPie (or through events?)
5) websiteURL (String) - The website url for this merchant
6) zip (Integer) - The zipcode of the merchant
7) city (String) - The city the merchant is in
8) street (String) - The street address of the merchant
9) country (String) - The country or state of the merchant
10) phone (String) - The phone number of this merchant
11) contactFirstName (String) - The first name of the merchant's primary contact for events
12) contactLastName (String) - The last name of that contact
13) contactEmail (String) - The email of that contact
14) contactPhone (String) - The phone number of that contact
15) bigpie_slug (String) - The slug for this merchant. Their page on BigPie can be accessed at www.bigpie.com/merchants/:bigpie_slug
16) hostedEvents (Integer) - The number of events this merchant has hosted
17) sponsoredEvents (Integer) - The number of events this merchant has sponsored
18) suggestedGiveback (Decimal) - This merchant's preferred giveback factor
19) suggestedGivebackType ("%" or "$") - This merchant's perferred giveback type
20) sponsorInterest (True or False) - Is this merchant interested in sponsoring events
21) hostInterest (True or False) - Is this merchant interested in hosting events
22) about (Text) - A description of this merchant
23) type (Integer) - The ID number of a merchant_type record
24) capacityPerHour (Integer) - The ID number of a merchant_sizes record
25) costGroup (Integer) - The ID number of a cost_groups record

### The Nonprofits Table

The Nonprofits table stores all relevant information about the nonprofit itself.

#### Fields

1) bigpie_id (String) - The MongoDB id of this nonprofit in the live BigPie database
2) name (String) - The name of this nonprofit
3) totalSales (Decimal) - The total sales driven through events (or through BigPie?)
4) totalraised (Decimal) - The total amount this nonprofit has raised through BigPie (or through events?)
5) websiteURL (String) - The website url for this nonprofit
6) zip (Integer) - The zipcode of the nonprofit
7) city (String) - The city the nonprofit is in
8) street (String) - The street address of the nonprofit
9) country (String) - The country or state of the nonprofit
10) phone (String) - The phone number of this nonprofit
11) contactFirstName (String) - The first name of the nonprofit's primary contact for events
12) contactLastName (String) - The last name of that contact
13) contactEmail (String) - The email of that contact
14) contactPhone (String) - The phone number of that contact
15) bigpie_slug (String) - The slug for this nonprofit. Their page on BigPie can be accessed at www.bigpie.com/nonprofits/:bigpie_slug
16) organizedEvents (Integer) - The number of events this nonprofit has organized
17) about (Text) - A description of this nonprofit
18) type (Integer) - The ID number of a nonprofit_type record
19) sizeGroup (Integer) - The ID number of a nonprofit_sizes record
20) donationLink (String) - The direct donation link for this nonprofit
21) taxId (String) - The Tax ID of this nonprofit
22) socialSite (String) - The facebook or other social media link for this nonprofit

### The RSVPs Table

This table represents individual RSVPs from event attendees for a specific event.

#### Fields

1) bigpie_patron_id (Integer) - The MongoDB ID for this patron in the live BigPie database
2) eventId (Integer) - The ID of the event object this RSVP is for
3) email (String) - The email address of the Patron, retrieved when they RSVP
4) type ('yes', 'no', 'maybe') - The RSVP type

### The Attendance_Levels Enumeration Table

This table represents the categories for expected attendance levels. We may want to merge all of the sizing tables into one, though this would require that the options for merchant_sizes, nonprofit_sizes and expected_attendance be the same.

What levels should we have? (1-10, 11-20, 21-50, 51-100, >100)

#### Fields

1) min (Integer) - The minimum attendance number for this category
2) max (Integer) - The maximum attendance number for this category
3) name (String) - The displayed name of this category

### The Merchant_Sizes Enumeration Table

This table represents the categories for Merchant capacities. We may want to merge all of the sizing tables into one, though this would require that the options for merchant_sizes, nonprofit_sizes and expected_attendance be the same.

What sizes should we have?

#### Fields

1) min (Integer) - The minimum capacity for this category
2) max (Integer) - The maximum capacity for this category
3) name (String) - The displayed name of this category

### The Nonprofit_Sizes Enumeration Table

This table represents the categories for Nonprofit sizes. We may want to merge all of the sizing tables into one, though this would require that the options for merchant_sizes, nonprofit_sizes and expected_attendance be the same.

What sizes should we have?

#### Fields

1) min (Integer) - The minimum size for this category
2) max (Integer) - The maximum size for this category
3) name (String) - The displayed name of this category

### The Event_Types Enumeration Table

This table represents all of the Event types we have. It is used for filtering and searching for Events.

What types should we have? Should we have an "Other" type or allow users to input their own new types?

#### Fields

1) name (String) - The name of this type

### The Merchant_Types Enumeration Table

This table represents all of the Merchant types we have. It is used for filtering and searching for Merchants.

Types are loaded from BigPie records. If a type is not found when a new merchant is added, the type will be added to our database.

#### Fields

1) name (String) - The name of this type

### The Nonprofit_Types Enumeration Table

This table represents all of the Nonprofit types we have. It is used for filtering and searching for Nonprofits.

Types are loaded from BigPie records. If a type is not found when a new nonprofit is added, the type will be added to our database.

#### Fields

1) name (String) - The name of this type

### The Cost_Groups Enumeration Table

This table represents all of the expensiveness levels we have for Merchants. It is used for searching for Merchant Hosts as well as being displayed on the event information.

What cost groups should we have?

#### Fields

1) min (Integer) - The minimum cost for this type
2) max (Integer) - The maximum cost for this type
3) name (String) - The name of this type

### The Merchants_Events Table

This table is simply a join table for showing a relationship between a merchant host and a particular event.

#### Fields

1) eventId (Integer) - The ID of the Event
2) merchantId (Integer) - The ID of the Merchant Host
3) giveback (Decimal) - The giveback factor for this event (0-100 for percent or any decimal for flat rate)
4) givebackType ("%" or "$") - The giveback type for this event (percent or flat rate)

### The Sponsors_Events Table

This table is simply a join table for showing a relationship between a merchant sponsor and a particular event.

#### Fields

1) eventId (Integer) - The ID of the Event
2) sponsorId (Integer) - The ID of the Merchant Sponsor
3) max (Decimal) - The maximum amount for this sponsorship (MerchantMatch)

### The Nonprofits_Events Table

This table is simply a join table for showing a relationship between a nonprofit and a particular event.

#### Fields

1) eventId (Integer) - The ID of the Event
2) nonprofitId (Integer) - The ID of the nonprofit
3) expectedAttendance (Integer) - The ID of an attendance_levels record