<aura:application extends="ltng:outApp"
  access="global"
  implements="ltng:allowGuestAccess">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/> -->
  <aura:dependency resource="c:main" />
  <aura:handler name="cmpEvent"
    event="c:componentEvent"
    action="{!c.changeLanguage}"/>
</aura:application>
