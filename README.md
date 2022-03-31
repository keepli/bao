## halo雪主题定制版

### 1.图标插件js

- fontawesome5.x版本

```html
<link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/5.15.2/css/all.css" crossorigin="anonymous"/>
```

- 动态图标

```html
<link type='text/css' rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Sanarous/files@master/font-awesome-animation.min.css">
```



### 2.修改评论模块

- 在后台管理系统选项中找到评论系统，修改评论模块js为以下js插件

```js
https://cdn.jsdelivr.net/gh/LIlGG/halo-comment-sakura/dist/halo-comment.min.js
```



### 3.添加导航栏logo图标

- 修改了原主题文件`module/header.ftl`，只需要在后台管理主题选项中找到菜单模块，编辑时添加图标

```html
<i class="fab fa-fort-awesome faa-horizontal"></i>
```



### 4.将文章页面的标签#号替换为图标

- 修改了原主题文件`post.ftl`，添加了标签图标



### 5.将主页分类的标签#号替换为图标

- 修改了原主题文件`module/widget/post_list.ftl`，添加了标签图标
