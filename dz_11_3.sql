-- В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

-- создадим пару ключ-значение, где ключ - это ip-адрес, а значение - количество вхождений, которое на старте 0
-- при каждом вызове incr "ключ" значение "значения" увеличивается на единицу 
127.0.0.1:6379> set 192.168.0.0 0
OK
127.0.0.1:6379> incr 192.168.0.0
(integer) 1
127.0.0.1:6379> incr 192.168.0.0
(integer) 2
127.0.0.1:6379> incr 192.168.0.0
(integer) 3

-- создадим вторую аналогичную пару ключ-значение, но с другим ip и с помощью incr прибавим значение "значения" и здесь
127.0.0.1:6379> set 192.168.1.1 0
OK
127.0.0.1:6379> incr 192.168.1.1
(integer) 1
127.0.0.1:6379> incr 192.168.1.1
(integer) 2

-- вот так можно посмотреть наши ключи
127.0.0.1:6379> keys 192*
1) "192.168.1.1"
2) "192.168.0.0"

-- а так получить значения по ключу. Видно, что они не ноль
127.0.0.1:6379> get 192.168.0.0
"3"
127.0.0.1:6379> get 192.168.1.1
"2"

