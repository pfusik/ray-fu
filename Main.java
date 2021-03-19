import java.io.FileOutputStream;
import java.io.IOException;

public class Main
{
	public static void main(String[] args) throws IOException
	{
		int level = args.length == 1 ? Integer.parseInt(args[0]) : 6;
		byte[] pgm = new byte[RayTracer.PGM_LENGTH];
		RayTracer.render(pgm, level);
		try (FileOutputStream os = new FileOutputStream("java.pgm")) {
			os.write(pgm);
		}
	}
}
