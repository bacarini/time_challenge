Time Challenge
==============
The system calculates the total cost for calls.

To do so, there are some rules:

  - The first 5 minutes of each call are billed at 5 cents per minute
  - The remainer of the call is billed at 2 cents per minute
  - The caller with the highest total call duration of the day will not be charged
  - The input must be in the following format
    ```
    09:11:30;09:15:22;+351914374373;+351215355312
    ```

Requirements:
-------------

* Ruby 2.4.0
* The extension file must be txt
* The input file must be on the same directory as the main.rb

Test:
-----
```ruby
Bundle Install
rspec spec/
```

Run:
----
The system only accept input from files. To execute run the command below.

```shell
./main.rb input.txt
```
