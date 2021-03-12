using System.IO;

public static class RayTracerEntryPoint
{
	public static void Main(string[] args)
	{
		int level = args.Length == 1 ? int.Parse(args[0]) : 6;
		byte[] pgm = new byte[RayTracer.PgmLength];
		RayTracer.Render(pgm, level);
		File.WriteAllBytes("cs.pgm", pgm);
	}
}
