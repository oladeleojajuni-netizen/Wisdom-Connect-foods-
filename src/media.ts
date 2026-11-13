// Remote sample photography; replace with properly licensed assets before commercial launch.
export const recipeImages:Record<string,string>={
 jollof:'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=900',
 egusi:'https://images.unsplash.com/photo-1547592180-85f173990554?w=900',
 suya:'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=900',
 alfredo:'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=900',
 salmon:'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=900',
 pizza:'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=900',
 burger:'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=900',
 pancakes:'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=900',
 greeksalad:'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=900',
 fallback:'https://images.unsplash.com/photo-1547592180-85f173990554?w=900'
};
// No unverified cooking videos are bundled. Add reviewed URLs per recipe.
const lessonVideos:Record<string,string>={};
export const videoForRecipe=(id:string)=>lessonVideos[id]||null;
