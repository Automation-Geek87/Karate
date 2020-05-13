Feature: DELETE test script

Scenario: Check 204 response code
* def dateStringToLong =
  """
  function(s) {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("yyyy-MM-dd");
    return sdf.parse(s).time; // '.getTime()' would also have worked instead of '.time'
    
  } 
  """
#* assert dateStringToLong("2016-12-24T03:39:21.081+0000") == 1482550761081
Given def myVar = 'world'

# using a variable
Then print myVar

* def timeLong = call dateStringToLong '2016-12-24'
Then print timeLong

#* assert timeLong == 1482550761081

* def getDate =
  """
  function() {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat('yyyy/MM/dd');
    var date = new java.util.Date();
    return sdf.format(date);
  } 
  """

* def temp = getDate()
* print temp

* def getDate =
  """
  function() {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat('07:45');
    var date = new java.util.Date();
    return sdf.format(date);
  } 
  """

* def temp = getDate()
* print temp


* def getDate =
  """
function(){ return java.lang.System.currentTimeMillis() + ''} 
  """

* def temp = getDate()
* print temp


#* def getDate =
#  """
#function(){ return java.lang.System.currentTime() + ''} 
#  """
#
#* def temp = getDate()
#* print temp

#function(){ return java.lang.System.currentTime() + ''


#* def getDate =
#  """
#  function() {
#  	
#  	var Calendar = Calendar.getInstance();
#  	
#  	
#    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
#    var sdf = new SimpleDateFormat('yyyy/MM/dd');
#    
#    return sdf.format(cal.getTime());
#  } 
#  """
#
#* def temp = getDate()
#* print temp


#Calendar cal = Calendar.getInstance();
#        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
#        System.out.println( sdf.format(cal.getTime()) );


