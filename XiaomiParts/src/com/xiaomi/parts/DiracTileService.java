package com.xiaomi.parts;
 
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
 
public class DiracTileService extends TileService {
 
    private DiracOnBoot mDiracOnBoot;
 
    @Override
    public void onStartListening() {
 
        mDiracOnBoot = new DiracOnBoot(getApplicationContext());
 
        boolean enhancerEnabled = mDiracOnBoot.isDiracEnabled();
 
        Tile tile = getQsTile();
        if (enhancerEnabled) {
            tile.setState(Tile.STATE_ACTIVE);
        } else {
            tile.setState(Tile.STATE_INACTIVE);
        }
 
        tile.updateTile();
 
        super.onStartListening();
    }
 
    @Override
    public void onClick() {
        Tile tile = getQsTile();
        if (mDiracOnBoot.isDiracEnabled()) {
            mDiracOnBoot.setEnabled(false);
            tile.setState(Tile.STATE_INACTIVE);
        } else {
            mDiracOnBoot.setEnabled(true);
            tile.setState(Tile.STATE_ACTIVE);
        }
        tile.updateTile();
        super.onClick();
    }
}
 
