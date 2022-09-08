CREATE ALIAS IF NOT EXISTS DATE_FORMAT AS '
String date_format(java.sql.Date value, String format) {
    return "";
}
';

CREATE ALIAS IF NOT EXISTS DATE_ADD AS '
String date_add(java.sql.Date value, int interval) {
    return "";
}
';


CREATE ALIAS IF NOT EXISTS TIMEDIFF AS '
String time_diff(java.sql.Date d1, java.sql.Date d2) {
    return "";
}
';


CREATE ALIAS IF NOT EXISTS WEEKDAY AS '
int time_diff(java.sql.Date d1) {
    return 1;
}
';


/*

CREATE ALIAS IF NOT EXISTS TIMESTAMPDIFF AS '
int timestamp_diff(String unit, java.sql.Date d1, java.sql.Date d2) {
    return 0;
}
';


/*

CREATE ALIAS IF NOT EXISTS `IF` AS '
    String ifFunction(boolean condition, String exp1, String exp2){
        if(condition) {
            return exp1;
} else {
            return exp2;
}
    }
';


 */