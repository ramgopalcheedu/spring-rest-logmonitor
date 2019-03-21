import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class Stock {

    public static void main(String[] args) throws IOException {

         List<Path> paths = Files.list(Paths.get("/Users/o548891/Desktop/March")).
                 collect(Collectors.toList());

        List<StockData> dataList = new ArrayList<>();

        for(Path path: paths){

            if(Files.exists(path)){

                List<StockData> stockDataList = Files.readAllLines(path).stream().filter(s -> !s.startsWith("Stock"))
                                        .map(e -> e.split(",",5))
                                        .map(e -> Stock.stockData(e))
                                        .collect(Collectors.toList());
                dataList.addAll(stockDataList);
            }
            }

           Map<String,Set<StockData>> dataMap =  dataList.stream().collect(HashMap::new, (BiConsumer<Map<String, Set<StockData>>, StockData>) (stockMap, stockData) -> {
                Set<StockData> stockSet = stockMap.get(stockData.getName());
                if(null!=stockSet){
                    stockSet.add(stockData);
                }else{
                    stockSet = new TreeSet<>((o1, o2) -> o1.getVolume()>o2.getVolume()?-1:1);
                    stockSet.add(stockData);
                    stockMap.put(stockData.getName(),stockSet);
                }
        }, (m1, m2) -> {});

       System.out.println(dataMap.entrySet().stream().count());
       fetchNoStockWithHighestVolume(dataMap, s -> s.getVolume()>300000);
       fetchNoStockWithHighestVolume(dataMap, s -> s.getVolume()<300000);

       fetchStocksPerfromedMorethanOnce(dataMap, r -> r.getValue().size()>1);
       fetchStocksPerfromedMorethanOnce(dataMap, r -> r.getValue().size()==1);

        findStockWithMaximumMoney(dataMap);
        findStockWithMinMoney(dataMap);

        }

    private static void findStockWithMaximumMoney(Map<String,Set<StockData>> dataMap) {

        System.out.println(dataMap.entrySet().stream().max((o1, o2) ->
                Stock.calculateValue(o1.getValue().iterator().next())>
                        Stock.calculateValue(o2.getValue().iterator().next())?1:-1).get().getKey());
    }

    private static void findStockWithMinMoney(Map<String,Set<StockData>> dataMap) {

       dataMap.entrySet().stream().max((o1, o2) ->
                Stock.calculateValue(o1.getValue().iterator().next())>
                        Stock.calculateValue(o2.getValue().iterator().next())?-1:1).get().getKey();
    }

    private static Double calculateValue(StockData next) {
        return next.getVolume()*next.getPrice();
    }

    private static void fetchStocksPerfromedMorethanOnce(Map<String, Set<StockData>> dataMap,Predicate<Map.Entry<String, Set<StockData>>> predicate) {

        System.out.println(dataMap.entrySet().stream().filter(predicate).map(Map.Entry::getKey).collect(Collectors.toList()));

    }

    private static void fetchNoStockWithHighestVolume(Map<String,Set<StockData>> dataMap, Predicate<StockData> stockDataPredicate) {
        System.out.println(dataMap.entrySet().stream().filter(stringSetEntry -> stringSetEntry.getValue().stream().anyMatch(stockDataPredicate)).count());
    }

    public static StockData stockData(String[] arr){
        return StockData.builder().name(arr[0].trim()).price(Double.parseDouble(arr[1].trim()))
                .change(Double.parseDouble(arr[2].trim()))
                .percentage(Double.parseDouble(arr[3].trim()))
                .volume(Long.parseLong(arr[4].
                        replace(",","").replaceAll("\\s","").trim()))
                .instance();
    }

}
