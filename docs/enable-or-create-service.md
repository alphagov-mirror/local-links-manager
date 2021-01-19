# Enabling (or creating) a new service

From time to time, we have requests to add new LGSL codes. For this,
you'll need to know the LGSL code, the description of the service and
the providing tier.

They are imported automatically each night from https://standards.esd.org.uk so
we only need to enable them in this app.

## 1. Check that the new service has been imported from ESD
This happens automatically each night, but you can check that there is a `Service`
in the database with the `lgsl_code` you're enabling.

## 2. Add to the CSV of enabled services in Publisher:
There is a [CSV file](https://github.com/alphagov/publisher/blob/master/data/local_services.csv)
that contains the LGSL codes that are active on GOV.UK

To add a new LGSL code:
- Add the code itself in the first column in the CSV file.
- Add the description in the second column.
- Add the providing tier in the third column.

Providing tiers can be:
- `all`
- `county/unitary`
- `district/unitary`

After deploying this you will need to run the rake task `local_transactions:fetch_and_clean`
against the Publisher app.

## 3. Activate relevant service interactions
You can either do this by creating a local transaction in Publisher, but this
may show the transaction on the live site before the links are ready, so check
with your product manager to make sure this is OK.

Or use the [`service:enable`](../lib/tasks/service.rb) rake task instead. If
you need to create a new service that has not been defined by the Local
Government Association, you can specify a dummy LGSL code, along with a label
and slug to create a new service.

## 4. Add missing links for new service interaction
Run the rake task `import:missing_links`.

## 5. Content/department follow-up
Once all the above is done the content team and/or department can follow up by
creating the local transaction in Publisher (if not done previously) and filling
in the missing links in Local Links Manager.
