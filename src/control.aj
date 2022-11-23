import javax.swing.JLabel;

public aspect control {
    after():
        call(* start()) {
            System.out.println("Se inicio un hilo");
    }
    
    after(JLabel label):
        call(* insertarEntidad(JLabel)) && args(label){
            System.out.println("Se insertó una nueva entidad al juego");
    }
    
    after(JLabel label):
        call(* remover(JLabel)) && args(label){
            System.out.println("Se borró una entidad del juego");
    }
    
    before(int code):
        call(* System.exit(int)) && args(code){
            if (code == 0) {
        System.out.println("Salida Exitosa");
        }else {
            System.out.println("Salida Defectuosa");
        }
    }
}