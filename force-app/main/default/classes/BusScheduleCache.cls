public class BusScheduleCache 
{
	private Cache.OrgPartition part;
    
    public BusScheduleCache()
    {
        Cache.OrgPartition orgPart = Cache.Org.getPartition('local.BusSchedule');
        
        if(orgPart != null)
        {
        	this.part = orgPart;            
        }
    }
    
    public void putSchedule(String busLine, Time[] schedule)
    {
        //Cache.OrgPartition orgPart = Cache.Org.getPartition('local.BusSchedule');
		//orgPart.put(busLine, schedule);
        this.part.put(busLine, schedule);
        
        //System.debug(orgPart.get(busLine));
        System.debug(part.get(busLine));
    }
    
    public Time[] getSchedule(String busLine)
    {
        Cache.OrgPartition orgPart = Cache.Org.getPartition('local.BusSchedule');
        
        System.debug(orgPart.get(busLine));
        
        Time[] cachedTime;
        cachedTime = (Time[])orgPart.get(busLine);
        
        if(cachedTime != null && !cachedTime.isEmpty())
        {
            return cachedTime;
        }
        else
        {
            Time tmDefault1 = Time.newInstance(8, 0, 0, 0);
            Time tmDefault2 = Time.newInstance(17, 0, 0, 0);
            
            cachedTime = new Time[2];
            
            cachedTime[0] = tmDefault1;
            cachedTime[1] = tmDefault2;
            
            return cachedTime;
        }
    }
    
}