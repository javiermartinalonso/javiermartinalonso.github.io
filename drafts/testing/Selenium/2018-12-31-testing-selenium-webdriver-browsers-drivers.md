---
layout: post
section: "testing"
title:  "testing-selenium-webdriver-browsers-drivers"
date:   2018-12-31
desc: "testing-selenium-webdriver-browsers-drivers."
keywords: "selenium,webdriver,chromedriver,geckodriver,testing"
categories: [testing]
tags: [selenium,webdriver]
icon: 
image: static/img/blog/
---


http://learn-automation.com/launch-chrome-browser-using-selenium-webdriver/

Hola, Bienvenido al tutorial de Selenium, hoy hablaremos sobre Lanzar el navegador Chrome usando Selenium Webdriver.

Selenium Webdriver admite de forma predeterminada el navegador Firefox, y esa es la razón por la que no tuvimos problemas al trabajar con Firefox. Para ejecutar tu script en los diferentes navegadores como Chrome, IE , etc.

Si está trabajando con el navegador IE, entonces también debe conocer los desafíos  que enfrentará al trabajar con el navegador IE. Esta es una de las preguntas más importantes en las entrevistas también. 
Tenemos que descargar los controladores por separado y tenemos que especificar la ruta también con la ubicación del controlador. 
Nota: Selenium Webdriver es compatible con la última versión de Chrome.

 

 

Puede recomendar un video completo de YouTube



 

 

Paso 1: descarga la unidad de Chrome

Abra cualquier navegador y abra http://www.seleniumhq.org/download/ Aquí obtendrá la sección de controladores de terceros y podrá obtener todos los controladores externos para diferentes navegadores. Haga clic en 2.22 enlace Nota: la última versión de Chrome es 2.22, por lo que obtendrá la última versión 



Inicie el navegador Chrome utilizando Selenium Webdriver


 
 

Aquí obtendrá el archivo zip del controlador que puede extraer, después de la extracción, obtendrá el archivo chromedrive.exe

 

Nota: el selenio proporciona solo 32 bits, pero también puede usarlo para máquinas de 64 bits. Prácticamente lo intenté y funciona bien

Inicie el navegador Chrome utilizando Selenium Webdriver

 

Programa para Run Selenium Webdriver en Chrome navegador

package demotc;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;
public class Openchrome {

@Test
public void test12() throws Exception{

// Initialize browser
WebDriver driver=new ChromeDriver();

// Open Google
driver.get("http://www.google.com");

// Close browser
driver.close();
}

}

package demotc;
 
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;
public class Openchrome {
 
@Test
public void test12() throws Exception{
 
// Initialize browser
WebDriver driver=new ChromeDriver();
 
// Open Google
driver.get("http://www.google.com");
 
// Close browser
driver.close();
}
 
}
 

Salida:-

Inicie el navegador Chrome utilizando Selenium Webdriver
Script en ChromeBrowser

Su caso de prueba fallará y obtendrá IllegalStateException que dice que necesitamos especificar la ruta del controlador de Chrome donde reside.

Si notas Selenium también da un mensaje muy significativo de que necesitamos agregar alguna variable chrome también mientras ejecutamos el script.

El nombre de la variable es - webdriver.chrome.driver

En Java para establecer la variable usamos el método setProperty de la clase System, así que permítanos agregar lo mismo en nuestro programa

Programa de ejemplo para iniciar el navegador Chrome usando Selenium Webdriver

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.chrome.ChromeDriver;

public class TestChrome {

public static void main(String[] args) {

System.setProperty("webdriver.chrome.driver", "path of the exe file\\chromedriver.exe");

// Initialize browser
WebDriver driver=new ChromeDriver();

// Open facebook
driver.get("http://www.facebook.com");

// Maximize browser

driver.manage().window().maximize();


import org.openqa.selenium.WebDriver;
 
import org.openqa.selenium.chrome.ChromeDriver;
 
public class TestChrome {
 
public static void main(String[] args) {
 
System.setProperty("webdriver.chrome.driver", "path of the exe file\\chromedriver.exe");
 
// Initialize browser
WebDriver driver=new ChromeDriver();
 
// Open facebook
driver.get("http://www.facebook.com");
 
// Maximize browser
 
driver.manage().window().maximize();
 
}
 
}
 

Gracias por visitar mi blog. Sigue leyendo. Que tengas un buen día



## Referencias ##

http://learn-automation.com/launch-chrome-browser-using-selenium-webdriver/