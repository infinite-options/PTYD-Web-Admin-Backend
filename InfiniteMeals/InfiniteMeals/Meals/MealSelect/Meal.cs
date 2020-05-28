public class Meal
{
    public string Name { get; set; }
    public string Description { get; set; }
    public string ImageUrl { get; set; }
    public string InfoUrl { get; set; }

    public override string ToString()
    {
        return Name;
    }
}