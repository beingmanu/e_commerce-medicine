parceformateDate(datestring) {
  if (datestring != null) {
    datestring = datestring.replaceAll("T", " ");
    DateTime parsedDateTime = DateTime.parse(datestring);
    // Now you can work with parsedDateTime
    return parsedDateTime;
  } else {
    return DateTime(1999);
    // Handle the case where 'date_created' is null
  }
}
