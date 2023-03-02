<h1 align="center"> Практическая работа №2 </h1>
<h3 align="center"> Тема: Создание frontend-части приложения для создания заметок </h3>
<p> Цель: Использовать фреймворк Flutter для создания мультиплатформенного приложения для просмотра, редактирования, удаления и добавления заметок и категорий. </p>
</br>
<p> №1. Подключение зависимостей </p>
Прежде всего необходимо подключить недостающие зависимости: Freezed - для генерации классов с различным функционалом по заданным моделям, Build runner - для обеспечения генерации классов, Dio - http-client для отправки запросов и получения ответов на них, Get it - инъекция зависимостей, Go router - для более удобной навигации и Shared Preference для сохранения пользовательских данных.
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic1.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 1 - Зависимости </p>

<p> №2. Создание моделей </p>
На фронт-энд части приложения также необходима проработка моделей, ведь их нужно будет выводить и отправлять в запросах. На скриншоте представлен пример создания модели Post. Необходимо указать part-ы, из которых состоит класс (они будут сгенерированы позже), а также - аннотацию freezed. Помимо этого, нужно указать именованный метод fromJson. После этого, необходимо зайти в терминал и прописать команду "pub run build_runner build" - нужные классы автоматически сгенерируются.

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic2.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 2 - Создание модели </p>

<p> №3. Страница авторизации </p>
Авторизация реализована виджетом с состояниями. Представлено два текстовых поля - для ввода логина и пароля. На кнопку "Login" добавлен метод AuthWidget, который отправляет запрос на авторизацию и возвращает токен, с помощью который будут проводиться дальнейшие операции.
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic3.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 3 - Страница авторизации </p>

<p> №4. Навигация </p>
В качестве навигации представлена нижняя панель, которая реализуется с помощью класса BottomNavigationBar. Дочерние элементы этого класса - кнопки, нажатие на которые обрабатывается. В зависимости от индекса кнопки, body данного виджета меняется на тот виджет, который соответствует индексу. Таким образом происходит перемещение между виджетами приложения.
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic4.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 4 - BottomNavigationBar </p>

<p> №5. Dio </p>
Для получения данных по запросам используется http-client DIO. В классе реализованы методы, который отправляют запросы по указанному URL и возвращают ответы на них. Можно указать тело запроса, тип, а также заголовки. Помимо этого, присутствует обработка исключений и различных HTTP-статусов. 
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic5.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 5 - DIO </p>

<p> №6. Поиск </p>
Поиск реализован с помощью абстрактного класса SearchDelegate, который позволяет настроить собственную имплементацию методов с помощью аннотации override. Таким образом реализован вывод подсказок, вывод результатов поиска с функциональными кнопками удаления и изменения поста, закрытие поиска и очистка текстового поля. 
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic6.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 6 - Поиск </p>

<p> №7. Home page </p>
Главная страница представляет собой лист со всеми заметками пользователя. Каждая заметка имеет информацию о дате создания, изменения, именовании, содержани и категории. Помимо этого, на главной странице можно удалять заметки, переходить к изменению и добавлению. 
Заметки выводятся с помощью класса FutureBuilder, который ожидает возвращения результата функции getNotes - отправка запроса на получение заметок. 

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic7.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 7 - Home Page </p>

<p> №8. Добавление заметки </p>
Страница добавления заметки представляет собой текстовые поля с данными о заметки, а так же выпадающий список с категорией. Заполнение категорий производится с помощью класса FutureBuilder и функции, которая реализована в классе Dio. По нажатию на кнопу "Create Note" отправляется запрос на создание заметки. Пользователю выводится всплывающее уведомление о результатах запроса.  

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic8.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 8 - Добавление заметки </p>

<p> №9. Изменение заметки </p>
Изменение заметки схоже с добавлением с той разницей, что по нажатию на кнопку вызывается запрос на изменение заметки, в функцию отправляется ее ID. Помимо этого, все текстовые поля при построении виджета автоматически заполняются данными. 
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic9.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 9 - Изменение заметки </p>

<p> №10. Удаление заметки </p>
Для удаления заметки необходимо нажать на соответствующую кнопку рядом с заметкой. После этого появится всплывающее окно с информацией о процессе удаления. Удаление также реализовано через запрос. 
<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic10.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 10 - Удаление заметки </p>

<p> Результат работы программы: </p>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic11.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 11 - Авторизация </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic12.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 12 - Home Page </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic13.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 13 - Поиск </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic14.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 14 - Добавление заметки </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic15.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 15 - Профиль </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic16.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 16 - Изменение заметки </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic17.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 17 - Изменение профиля </p>
<br/>

<div align="center"> 
<img src="https://github.com/midnightRanger/Notes_App_Frontend/blob/main/images/pic17.jpg?raw=true">
</div>
<p color="grey" style="font-size: 12px" align="center"> Рисунок 17 - Изменение профиля </p>
<br/>

<h3> Заключение <h3>

В ходе практической работы были усвоены принципы работы с фреймворком Conduit, была реализована backend-часть приложения на Dart'e. Развернуто API с системами авторизации и регистрации, которое позволяет манипулировать данными из БД, изменять, удалять, производить логическое удаление и восстановление, осуществлять поиск и пагинацию данных. 