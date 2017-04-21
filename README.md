#Support Study Planner

Это приложение является прототипом веб-интерфейса для проекта 
[*Study Planner*](http://studyplanner.ru/). С помощью данного сайта пользователи смогут оставлять свои отзывы о приложении и учавствовать в его развитии. 
 
[Официальная группа](https://vk.com/studyplanner_app) проекта в ВК .




Как установить:

+ Установите git, у кого нет

`sudo apt-get update`

`sudo apt-get install git`

+ Далее в домашней директории:

`git clone https://github.com/saptan/studyplanner-feedback

`cd studyplanner-feedback`

`bundle install`

`rake db:create`

`rake db:migrate`

`rake db:seed`

+ Запустите сервер
`rails server`
