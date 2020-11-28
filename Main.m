function Main()
   CarrierLines = CarrierLineFinder();
   Counter = 1;
   
   
   for i = 1:numel(CarrierLines)
      y = LineSerperator(CarrierLines{Counter});
      Counter = Counter + 1;
   end
   
end