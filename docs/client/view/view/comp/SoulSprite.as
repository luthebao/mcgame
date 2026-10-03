// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SoulSprite

package com.qeedoo.ui.view.comp
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.net.URLLoader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.qeedoo.ui.resource.ResManager;
    import flash.net.URLRequest;

    public class SoulSprite extends Sprite 
    {

        public static var loaderCache:Object = new Object();

        private var resUrl:String = "";
        private var currentFrame:* = 0;
        private var mc:MovieClip;
        private var currentLoadingUrl:String = "";

        private var loader:Loader = new Loader();
        private var urlLoader:URLLoader = new URLLoader();


        public function gotoAndPlay(_arg_1:*):void
        {
            currentFrame = _arg_1;
            if (!mc)
            {
                mc = new MovieClip();
            };
            mc = (loader.content as MovieClip);
            if (((mc) && (mc.hasOwnProperty("gotoAndPlay"))))
            {
                if (mc.currentFrameLabel != currentFrame)
                {
                    mc.gotoAndPlay(currentFrame);
                };
            };
        }

        public function destroy():void
        {
            loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            this.removeChild(loader);
            loader.unload();
        }

        public function unShow():void
        {
            loader.visible = false;
            if (((mc) && (mc.hasOwnProperty("stop"))))
            {
                mc.stop();
                mc = null;
            };
            destroy();
        }

        public function getBitmapData(_arg_1:Boolean=false):BitmapData
        {
            var _local_2:BitmapData;
            var _local_3:Matrix;
            if (!mc)
            {
                mc = new MovieClip();
            };
            mc = (loader.content as MovieClip);
            if (((mc) && (mc.hasOwnProperty("gotoAndPlay"))))
            {
                mc.gotoAndPlay(currentFrame);
                _local_2 = new BitmapData(mc.width, mc.height, true, 0);
                _local_3 = new Matrix();
                _local_3.tx = (mc.width / 2);
                _local_3.ty = (mc.height / 2);
                _local_2.draw(mc, _local_3);
            };
            return (_local_2);
        }

        public function loadCompleteHandler(_arg_1:Event):void
        {
            loader.visible = true;
            if (!mc)
            {
                mc = new MovieClip();
            };
            mc = (loader.content as MovieClip);
            if (((mc) && (mc.hasOwnProperty("gotoAndPlay"))))
            {
                mc.gotoAndPlay(currentFrame);
            };
            mc.x = 0;
            mc.y = 0;
            loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
        }

        private function loadErrorHandler(_arg_1:IOErrorEvent):void
        {
        }

        public function show(_arg_1:String):void
        {
            var _local_2:String;
            _local_2 = ResManager.hash((_arg_1 + "_NEW.swf"));
            this.currentLoadingUrl = _local_2;
            addChild(loader);
            loader.x = 33;
            loader.y = 33;
            loader.addEventListener(Event.COMPLETE, loadCompleteHandler);
            loader.addEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            loader.load(new URLRequest(_local_2));
        }


    }
}//package com.qeedoo.ui.view.comp

