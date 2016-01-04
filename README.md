# RailsAdminCMS

*Flexible Content Management Framework for RailsAdmin*

## Overview

RailsAdmin...

## Body classes helper

Seamlessly adds some useful classes to the body tag within your layout in order to scope your css/js : `cms-template-name`, `controller-name`, `controller-name-action-name`, `locale` and `edit-mode`.

```ruby
# ...
</head>
<body class="<%= cms_body_class 'other-class', 'etc' %>">
# ...
</body>
</html>
```

## TODO

* Published Pages/Forms

## Notes

gem 'dalli-delete-matched'


This project rocks and uses MIT-LICENSE.