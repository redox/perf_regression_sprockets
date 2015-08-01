## sprockets-rails Performance Regression

This is the sample application illustrating the performance regression of `sprockets-rails` between `2.1.3`, `2.1.4`, `2.2.3`, `2.3.2` and `master`. It was originally motivated by https://github.com/rails/sprockets-rails/issues/225#issuecomment-126948651

The particularity of that project is that the `application.css.sass` requiresr **50** `sass` files.

Tested using `ab -c 1 -n 100 http://localhost:3000/posts/1`:

#### sprockets-rails 2.1.3

Median Processing Time: **20ms**

```
Server Software:        WEBrick/1.3.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /posts/1
Document Length:        7268 bytes

Concurrency Level:      1
Time taken for tests:   2.257 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      806500 bytes
HTML transferred:       726800 bytes
Requests per second:    44.30 [#/sec] (mean)
Time per request:       22.573 [ms] (mean)
Time per request:       22.573 [ms] (mean, across all concurrent requests)
Transfer rate:          348.92 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:    17   22   8.1     20      77
Waiting:       16   22   8.1     20      77
Total:         17   23   8.1     20      77

Percentage of the requests served within a certain time (ms)
  50%     20
  66%     23
  75%     25
  80%     26
  90%     28
  95%     32
  98%     62
  99%     77
 100%     77 (longest request)
```

#### sprocket-rails 2.1.4


Median Processing Time: **232ms**


```
Server Software:        WEBrick/1.3.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /posts/1
Document Length:        7268 bytes

Concurrency Level:      1
Time taken for tests:   26.063 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      806500 bytes
HTML transferred:       726800 bytes
Requests per second:    3.84 [#/sec] (mean)
Time per request:       260.635 [ms] (mean)
Time per request:       260.635 [ms] (mean, across all concurrent requests)
Transfer rate:          30.22 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:   208  260  57.8    232     491
Waiting:      208  260  57.7    232     491
Total:        209  261  57.8    233     491

Percentage of the requests served within a certain time (ms)
  50%    233
  66%    275
  75%    289
  80%    304
  90%    349
  95%    369
  98%    473
  99%    491
 100%    491 (longest request)
 ```


#### sprockets-rails 2.2.3

Median Processing Time: **178ms**

```
Server Software:        WEBrick/1.3.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /posts/1
Document Length:        9266 bytes

Concurrency Level:      1
Time taken for tests:   20.418 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      1006300 bytes
HTML transferred:       926600 bytes
Requests per second:    4.90 [#/sec] (mean)
Time per request:       204.180 [ms] (mean)
Time per request:       204.180 [ms] (mean, across all concurrent requests)
Transfer rate:          48.13 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       1
Processing:   138  204  71.5    178     573
Waiting:      137  204  71.5    178     573
Total:        138  204  71.5    178     573

Percentage of the requests served within a certain time (ms)
  50%    178
  66%    196
  75%    218
  80%    232
  90%    286
  95%    344
  98%    480
  99%    573
 100%    573 (longest request)
```

#### sprockets-rails 2.3.2

Median Processing Time: **182ms**

```
Server Software:        WEBrick/1.3.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /posts/1
Document Length:        9266 bytes

Concurrency Level:      1
Time taken for tests:   19.855 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      1006300 bytes
HTML transferred:       926600 bytes
Requests per second:    5.04 [#/sec] (mean)
Time per request:       198.547 [ms] (mean)
Time per request:       198.547 [ms] (mean, across all concurrent requests)
Transfer rate:          49.50 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       1
Processing:   137  198  57.7    182     519
Waiting:      137  198  57.7    182     519
Total:        137  198  57.7    182     519

Percentage of the requests served within a certain time (ms)
  50%    182
  66%    197
  75%    211
  80%    214
  90%    264
  95%    286
  98%    451
  99%    519
 100%    519 (longest request)
```

#### sprockets-rails master (ad4a43bd1bb19c86a8bf94a2ad5e477686161490)

Median Processing Time: **68ms**


```
Server Software:        WEBrick/1.3.1
Server Hostname:        localhost
Server Port:            3000

Document Path:          /posts/1
Document Length:        9266 bytes

Concurrency Level:      1
Time taken for tests:   7.071 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      1006300 bytes
HTML transferred:       926600 bytes
Requests per second:    14.14 [#/sec] (mean)
Time per request:       70.712 [ms] (mean)
Time per request:       70.712 [ms] (mean, across all concurrent requests)
Transfer rate:          138.97 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       1
Processing:    51   70  14.6     68     147
Waiting:       51   70  14.6     68     147
Total:         52   71  14.6     68     148

Percentage of the requests served within a certain time (ms)
  50%     68
  66%     73
  75%     74
  80%     77
  90%     87
  95%    102
  98%    120
  99%    148
 100%    148 (longest request)
 ```
