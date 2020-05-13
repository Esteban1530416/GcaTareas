import java.util.List;
Circulo c1, c2, c3, tmp;
List <Circulo>lista;
String id_text="";
float x, y;
int n = -1; //para el id del circulo
int k = 30;
int w = 0;

void setup()
{
  size(400,300);
  lista = new <Circulo>ArrayList();
  tmp = null;
  
  for (int i = 0; i < k; i++)
  {
    x = random(width);
    y = random(height);
    tmp = new Circulo(x, y, 50, w);
    w++;
    lista.add(tmp);    
  }   
}

void draw()
{
  background(0);  
  
  for(int i = 0; i < lista.size(); i++)
  {
    tmp = lista.get(i);
    //se actualiza las coordenadas
    if (tmp.mover == true)
    {
      tmp.x = mouseX;
      tmp.y = mouseY;
      //se actualiza las coordenadas
      lista.set(n, tmp);
    }
    tmp.dibuja();
  }
  
  textSize(24);
  fill(#DB145D);
  text(id_text, 40, 50);
  if (n != -1)
    text(n,140,30);
  fill(255);   
}

void mousePressed()
{
  id_text="";
  for(int i = lista.size()-1; i>=0; i--)
  {
     tmp = lista.get(i);
     if (tmp.isAdentro(mouseX, mouseY))
     {
       n = tmp.id;
       id_text += tmp.id;
       tmp.mover=true;       
       break;
     }   
  }
}

void mouseReleased()
{
  //si el id es 0 o mayor obtiene el circulo
  if (n != -1)
  {
    tmp = lista.get(n);
  }
  id_text = "";
  n = -1; //no se esta seleccionado ningun circulo
  tmp.mover = false;   
  tmp = null;
}
