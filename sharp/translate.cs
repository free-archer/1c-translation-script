using System.Diagnostics;
using System.Text.RegularExpressions;

internal class Program
{
    private static void Main(string[] args)
    {
        Stopwatch stopwatch = new Stopwatch();
        stopwatch.Start();

        String filename = "";
        String filename_en = "";

        //Console.WriteLine(args[0]);

        
        if (args.Length == 1) {
            if (args[0] == "-i") {
                Console.WriteLine("Введите имя файла:");
                filename = Console.ReadLine();
                filename_en = filename;
            } else {
                filename = args[0];   
                filename_en = filename; 
            }
        } else if (args.Length == 2) {

            filename = args[0];   
            filename_en = args[1];
        } else {
            filename = "testfile.txt";
            filename_en = "testfile_en.txt";
        }

        Console.WriteLine($"Исходный файл: {filename}");
        Console.WriteLine($"Файл результата: {filename_en}");

        String filedict = "../dict.txt";

        var dict_ru_en = new List<Tuple<string, string>>();
        
        if (!File.Exists(filedict)) {
            Console.WriteLine("Файл словаря не существует!");
            Environment.Exit(0);            
        }

        if (!File.Exists(filename)) {
            Console.WriteLine("Исходный файл не существует!");
            Environment.Exit(0);            
        }

        string[] Lines = File.ReadAllLines(filedict);
        foreach (string line in Lines)
        {
            

            if (line.StartsWith("#") || line.Length == 0) {
                continue;
            }

            Regex rx = new Regex(@"^(\w+) - (\w+)$");
            MatchCollection matches = rx.Matches(line);

            foreach (Match match in matches)
            {
                GroupCollection groups = match.Groups;

                Tuple<String, String> s= new Tuple<String, String> (groups[1].Value, groups[2].Value);
                dict_ru_en.Add(s);
            }
        }

        //READ FILE
        String text = "";
        if (File.Exists(filename)) {
            text = File.ReadAllText(filename);
        }
        
        
        foreach (Tuple<String, String> dict in dict_ru_en) {
            //String pattern = $"\\b{dict.Item1}\\b";
            String pattern = @$"\b{dict.Item1}\b";
            text = Regex.Replace(text, pattern, dict.Item2);
        }
        //Console.WriteLine(text);
        
        File.WriteAllText(filename_en, text);


      stopwatch.Stop();
      Console.WriteLine($"Выполнено! Время выполнения: {stopwatch.ElapsedMilliseconds} ms");
    }
}