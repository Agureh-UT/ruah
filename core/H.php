<?php

namespace Core;

use App\Models\Users;
use \DateTime;

class H
{
  public static function dnd($data)
  {
    echo '<pre>';
    var_dump($data);
    echo '</pre>';
    die();
  }

    /**
   * limits Length of String to specified limit $length 
   * @method limitStringLength
   * @param  string      $x          Specifies the string to return a part of
   * @param  integer      $length     Specifies the length of the returned string.The length to be returned from the start parameter
   * @return string      Returns the extracted part of a string, or FALSE on failure, or an empty string
   */
  public static function limitStringLength($x, $length)
  {
    if (strlen($x) <= $length) {
      return $x;
    } else {
      $y = substr($x, 0, $length) . '...';
      /*
        * The substr() function returns a part of a string. 
        * SYNTAX:substr(string,start,length)
             1. string	Required. Specifies the string to return a part of
             2. start	Required. Specifies where to start in the string
                    (a) A positive number - Start at a specified position in the string
                    (b) A negative number - Start at a specified position from the end of the string
                    (c) 0 - Start at the first character in string
             3. length	Optional. Specifies the length of the returned string. Default is to the end of the string.
                    (a) A positive number - The length to be returned from the start parameter
                    (b) Negative number - The length to be returned from the end of the string
                    (c) If the length parameter is 0, NULL, or FALSE - it return an empty string 
          */
      return $y;
    }
  }
  
  public static function currentPage()
  {
    $currentPage = $_SERVER['REQUEST_URI'];
    $defaultController = strtolower(DEFAULT_CONTROLLER);
    if ($currentPage === SITE_ROOT || $currentPage === SITE_ROOT . $defaultController . '/index') {
      $currentPage = SITE_ROOT . $defaultController;
    }
    return $currentPage;
  }

  public static function getObjectProperties($obj)
  {
    return get_object_vars($obj);
  }

  public static function buildTopbar($menu)
  {
    $user = Users::currentUser();
    $username = $user ? "Hello " . $user->fname : '%USERNAME%';

    $html = '<div class="logo-section">
        <div class="logo">' . MENU_BRAND . '</div>
      </div>
      <div class="org-info">
        <div>AFRICAN SOCIAL DEVELOPMENT FOCUS (ASDEF)</div>
        <div>BEHIND MINISTRY OF WORKS WAJIR COUNTY</div>
        <div>PO BOX 131-70200 WAJIR</div>
      </div>';
    $html .= '<div class="user-info">';
    foreach ($menu as $key => $val) {
      $displayKey = ($key === '%USERNAME%') ? $username : $key;
      if ($displayKey === $username) {
        //display a user svg icon above the username
        $html .= '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="24" height="24" viewBox="0 0 256 256" xml:space="preserve">
<g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)">
	<path d="M 45 0 C 20.147 0 0 20.147 0 45 c 0 24.853 20.147 45 45 45 s 45 -20.147 45 -45 C 90 20.147 69.853 0 45 0 z M 45 22.007 c 8.899 0 16.14 7.241 16.14 16.14 c 0 8.9 -7.241 16.14 -16.14 16.14 c -8.9 0 -16.14 -7.24 -16.14 -16.14 C 28.86 29.248 36.1 22.007 45 22.007 z M 45 83.843 c -11.135 0 -21.123 -4.885 -27.957 -12.623 c 3.177 -5.75 8.144 -10.476 14.05 -13.341 c 2.009 -0.974 4.354 -0.958 6.435 0.041 c 2.343 1.126 4.857 1.696 7.473 1.696 c 2.615 0 5.13 -0.571 7.473 -1.696 c 2.083 -1 4.428 -1.015 6.435 -0.041 c 5.906 2.864 10.872 7.591 14.049 13.341 C 66.123 78.957 56.135 83.843 45 83.843 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/>
</g>
</svg>';
        //end of svg icon
        $html .= '<span>' . $username . '</span>';
      } else {
        $html .= '<a href="' . htmlspecialchars($val) . '" class="logout-btn">' . htmlspecialchars($displayKey) . '</a>';
      }
    }
    $html .= '</div>';

    return $html;
  }

  public static function buildMenuListItems($menu, $dropdownClass = "")
  {
    $currentPage = self::currentPage();
    $user = Users::currentUser();
    $username = $user ? "Hello " . $user->fname : '%USERNAME%';
    $html = '';

    foreach ($menu as $key => $val) {
      $displayKey = ($key === '%USERNAME%') ? $username : $key;

      if (is_array($val)) {
        // Build dropdown menu item
        $html .= '<div class="nav-item has-dropdown" onclick="toggleDropdown(this)">' . htmlspecialchars($displayKey);
        $html .= '<div class="dropdown ' . htmlspecialchars($dropdownClass) . '">';

        foreach ($val as $subKey => $subVal) {
          $active = ($subVal === $currentPage) ? 'active' : '';
          $html .= '<a class="dropdown-item ' . $active . '" href="' . htmlspecialchars($subVal) . '">' . htmlspecialchars($subKey) . '</a>';
        }

        $html .= '</div></div>';
      } else {
        // Build regular menu item
        $active = ($val === $currentPage) ? 'active' : '';
        $html .= '<a class="nav-item ' . $active . '" href="' . htmlspecialchars($val) . '">' . htmlspecialchars($displayKey) . '</a>';
      
      }
    }

    return $html;
  }

  public static function buildSidebarListItems($menu, $dropdownClass = "")
  {
    $currentPage = self::currentPage();
    $user = Users::currentUser();
    $html = '';

    // Add sidebar toggle only if user is logged in
    if ($user) {
      $html .= '<div class="sidebar-item" id="sidebarToggle"> ≡ <span> RESIZE</span></div>';
    }

    foreach ($menu as $key => $val) {
      // Skip username menu items in sidebar as requested
      if ($key === '%USERNAME%') {
        continue;
      }

      if (is_array($val)) {
        // Build dropdown sidebar item
        $html .= '<div class="sidebar-item has-dropdown" onclick="toggleSidebarDropdown(this)">' . htmlspecialchars($key);
        $html .= '<div class="sidebar-dropdown ' . htmlspecialchars($dropdownClass) . '">';

        foreach ($val as $subKey => $subVal) {
          $active = ($subVal === $currentPage) ? 'active' : '';
          $html .= '<a class="sidebar-dropdown-item ' . $active . '" href="' . htmlspecialchars($subVal) . '">' . htmlspecialchars($subKey) . '</a>';
        }

        $html .= '</div></div>';
      } else {
        // Build regular sidebar item
        $active = ($val === $currentPage) ? 'active' : '';
        $html .= '<a class="sidebar-item ' . $active . '" href="' . htmlspecialchars($val) . '">' . htmlspecialchars($key) . '</a>';

      }
    }

    return $html;
  }


  public static function getMonthName($monthNum)
  {
    // Use mktime() and date() function to 
    // convert number to month name 
    $monthName = date("F", mktime(0, 0, 0, $monthNum, 10));

    // Display output 
    return $monthName;
  }

  public static function getMonthNamev2($monthNum)
  {
    // Create date object to store the DateTime format 
    $dateObj = DateTime::createFromFormat('!m', $monthNum);

    // Store the month name to variable 
    $monthName = $dateObj->format('F');

    // Display output 
    return $monthName;
  }

  public static function getLastDayOfMonth($dateString)
  {
    $date = new DateTime($dateString);
    $date->modify('last day of this month');
    $lastDayinWords = $date->format('l');
    $lastDayinInteger = $date->format('t');
    $lastDayinInFull = $date->format('Y-m-d');
    // return $lastDayinWords;
    // return $lastDayinInteger;
    return $lastDayinInFull;
  }
  public static function getLastDayViaMonthNum($monthNum, $year)
  {
    $monthNumString = date("m", mktime(0, 0, 0, $monthNum, 10));
    $dateString = $year . '-' . $monthNumString . '-01';
    $dateString = date($dateString);
    $date = strtotime($dateString);
    $date = strtotime(date("Y-m-d", $date));
    $lastDayinInFull = date("Y-m-t", $date);
    return $lastDayinInFull;
  }
  public static function getFirstDayViaMonthNum($monthNum, $year)
  {
    $monthNumString = date("m", mktime(0, 0, 0, $monthNum, 10));
    $dateString = $year . '-' . $monthNumString . '-01';
    $dateString = date($dateString);
    $date = strtotime($dateString);
    $date = strtotime(date("Y-m-d", $date));
    $firstDayinInFull = date("Y-m-d", $date);
    return $firstDayinInFull;
  }

  //Round number to the nearest thousand
  public static function roundToNearestThousand($number)
  {
    return round($number, -3);
  }

  public static function isCurrentPage($page)
  {
    global $currentPage;
    if (!empty($page) && strpos($page, ':id') > -1) {
      $page = str_replace(":id", "", $page);
      return strpos($currentPage, $page) > -1;
    }
    return $page == $currentPage;
  }

  public static function print_recursive($arr)
  {

    foreach ($arr as $key => $val) {
      if (is_array($val)) {
        self::print_recursive($val);
      } else {
        echo ("$key = $val <br/>");
      }
    }
    return;
  }

  public static function getEnumCaseName($enum_id, $enumClass)
  {

    $cases = $enumClass::cases();
    // $casesAry = ['' => '-Select-'];
    $EnumCaseName = '';
    foreach ($cases as $case) {
      // $casesAry[$case->value] = $case->name;
      if ($case->value === $enum_id) {
        $EnumCaseName = $case->name;
        return $EnumCaseName;
        //if we find a match, break our for loop
        break;
      }
    }
    // return $sectionPartial;
  }
}
